//
//  FirebaseLoginAPIClientProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 13/12/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

protocol FirebaseRegisterAPIClientProtocol {
    func registerUser(email: String, password: String, username: String) async throws
}

class FirebaseRegisterAPIClient: FirebaseRegisterAPIClientProtocol {
    
    // MARK: - Auth methods
    
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
