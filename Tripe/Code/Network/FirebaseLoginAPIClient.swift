//
//  FirebaseAuthAPIClient.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

protocol FirebaseLoginAPIClientProtocol {
    func makeLogin(email: String, password: String) async throws
}

class FirebaseLoginAPIClient: FirebaseLoginAPIClientProtocol {
    
    // MARK: - Auth methods
    
    func makeLogin(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            UserSessionManager.shared.userSession = result.user
        } catch {
            throw error
        }
    }
}
