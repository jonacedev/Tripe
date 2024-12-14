//
//  FirebaseLoginAPIClientProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 13/12/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import AuthenticationServices

protocol FirebaseAuthAPIClientProtocol {
    func makeLogin(email: String, password: String) async throws
    func registerUser(email: String, password: String, username: String) async throws
    func makeLoginWithApple()
    func removeUserAndSession() async throws
}

class FirebaseAuthAPIClient: NSObject, FirebaseAuthAPIClientProtocol {
    
    // MARK: Apple variables
    var isReauthentication = false
    var currentNonce: String?
    var nonce: String? {
        currentNonce ?? nil
    }
    
    // MARK: - Auth methods
    
    func makeLogin(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            UserSessionManager.shared.userSession = result.user
        } catch {
            throw error
        }
    }
    
    func registerUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            UserSessionManager.shared.userSession = result.user
            
            let user = UserModel(id: result.user.uid, username: username, email: email)
            try await uploadUserData(user: user)
        } catch {
            print("Register error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func makeLoginWithApple() {
        askForAppleSignIn()
    }
    
    func removeUserAndSession() async throws {
        guard let user = Auth.auth().currentUser else { return }
        let providers = user.providerData.map { $0.providerID }
        
        do {
            if providers.contains("apple.com")  {
                askForAppleSignIn(isReauthentication: true)
            } else {
                try await removeUserSession(_for: user)
            }
        }
        catch {
            print("FirebaseAuthError: Failed to delete auth user. \(error)")
            throw error
        }
    }
    
    private func uploadUserData(user: UserModel) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            print("Upload user data error: \(error.localizedDescription)")
            throw error
        }
    }

}

// MARK: LOGIN WITH APPLE

extension FirebaseAuthAPIClient: ASAuthorizationControllerDelegate {
    
    func askForAppleSignIn(isReauthentication: Bool = false) {
        self.isReauthentication = isReauthentication
        currentNonce = AppleLoginHelper.shared.randomNonceString()
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = AppleLoginHelper.shared.sha256(currentNonce!)
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredentials = authorization.credential as? ASAuthorizationAppleIDCredential else {
            return
        }
        
        Task {
            do {
                if isReauthentication {
                    if let user = UserSessionManager.shared.userSession {
                        try await reauthenticateAppleID(appleIDCredentials, for: user, nonce: nonce)
                    }
                  
                } else {
                    let result = try await appleAuth(appleIDCredentials, nonce: nonce)
                    
                    if let result = result {
                        if let username = appleIDCredentials.fullName?.givenName {
                            let user = UserModel(id: result.user.uid, username: username, email: appleIDCredentials.email ?? "")
                            try await uploadUserData(user: user)
                        }
                        
                        UserSessionManager.shared.userSession = result.user
                    }
                }

            } catch {
                print("AppleAuthorization failed: \(error)")
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {

    }
    
    private func appleAuth(
        _ appleIDCredential: ASAuthorizationAppleIDCredential,
        nonce: String?
    ) async throws -> AuthDataResult? {
        guard let nonce = nonce else { return nil }
        guard let appleIDToken = appleIDCredential.identityToken else { return nil }
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else { return nil }
        
        let credentials = OAuthProvider.appleCredential(withIDToken: idTokenString,
                                                        rawNonce: nonce,
                                                        fullName: appleIDCredential.fullName)
        
        do {
            return try await Auth.auth().signIn(with: credentials)
        }
        catch {
            print("FirebaseAuthError: appleAuth(appleIDCredential:nonce:) failed. \(error)")
            throw error
        }
    }
    
    private func reauthenticateAppleID(
        _ appleIDCredential: ASAuthorizationAppleIDCredential,
        for user: User,
        nonce: String?
    ) async throws {
        do {
            guard let nonce = nonce else { return }
            guard let appleIDToken = appleIDCredential.identityToken else { return }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else { return }
   
            let credential = OAuthProvider.appleCredential(withIDToken: idTokenString,
                                                           rawNonce: nonce,
                                                           fullName: appleIDCredential.fullName)
            try await user.reauthenticate(with: credential)
            try await revokeAppleIDToken(appleIDCredential)
            try await removeUserSession(_for: user)
        }
        catch {
            print("Reauthenticate apple failed. \(error)")
            throw error
        }
    }
    
    private func revokeAppleIDToken(_ appleIDCredential: ASAuthorizationAppleIDCredential) async throws {
        guard let authorizationCode = appleIDCredential.authorizationCode else { return }
        guard let authCodeString = String(data: authorizationCode, encoding: .utf8) else { return }

        do {
            try await Auth.auth().revokeToken(withAuthorizationCode: authCodeString)
        }
        catch {
            print("Revoke apple token failed. \(error)")
            throw error
        }
    }
    
    private func removeUserSession(_for user: FirebaseAuth.User) async throws {
        try await removeUserData(userId: user.uid)
        try await user.delete()
        UserSessionManager.shared.userSession = nil
    }
    
    private func removeUserData(userId: String) async throws {
        do {
            let userRef = Firestore.firestore()
                .collection("users")
                .document(userId)
            try await userRef.delete()
            
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
}

