//
//  FirebaseLoginDataManagerProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 13/12/24.
//

protocol FirebaseRegisterDataManagerProtocol {
    func registerUser(email: String, password: String, username: String) async throws
}

class FirebaseRegisterDataManager {
    
    // MARK: - Properties
    
    private var apiClient: FirebaseRegisterAPIClientProtocol
    
    // MARK: - Object lifecycle
    
    init(apiClient: FirebaseRegisterAPIClientProtocol) {
        self.apiClient = apiClient
    }
}

extension FirebaseRegisterDataManager: FirebaseRegisterDataManagerProtocol {
    func registerUser(email: String, password: String, username: String) async throws {
        try await apiClient.registerUser(email: email, password: password, username: username)
    }
}
