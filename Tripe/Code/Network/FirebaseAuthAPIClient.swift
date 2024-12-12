//
//  FirebaseAuthAPIClient.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class FirebaseAuthAPIClient {
    
    // MARK: - Auth methods
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            let userModel = UserModel(id: result.user.uid, username: result.user.displayName ?? "", email: result.user.email ?? "")
            
            // Save the user data locally
            let encodedSession = try Firestore.Encoder().encode(userModel)
            UserDefaults.standard.set(encodedSession, forKey: "userSession")
        } catch {
            print("Login error: \(error.localizedDescription)")
            throw error
        }
    }
    
    @MainActor
    func registerUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = UserModel(id: result.user.uid, username: username, email: email)
            
            // Save the user on firebase
            try await uploadUserData(user: user)
        } catch {
            print("Register error: \(error.localizedDescription)")
            throw error
        }
    }
    
    @MainActor
    func uploadUserData(user: UserModel) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            print("Upload user data error: \(error.localizedDescription)")
            throw error
        }
    }
}
