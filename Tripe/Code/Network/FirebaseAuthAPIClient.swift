//
//  FirebaseLoginAPIClientProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 13/12/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

protocol FirebaseAuthAPIClientProtocol {
    func makeLogin(email: String, password: String) async throws
    func registerUser(email: String, password: String, username: String) async throws
}

class FirebaseAuthAPIClient: FirebaseAuthAPIClientProtocol {
    
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
