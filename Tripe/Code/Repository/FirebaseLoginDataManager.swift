//
//  CheckVersionDataManagerProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 13/12/24.
//

protocol FirebaseLoginDataManagerProtocol {
    func makeLogin(email: String, password: String) async throws
}

class FirebaseLoginDataManager {
    
    // MARK: - Properties
    
    private var apiClient: FirebaseAuthAPIClientProtocol
    
    // MARK: - Object lifecycle
    
    init(apiClient: FirebaseAuthAPIClientProtocol) {
        self.apiClient = apiClient
    }
}

extension FirebaseLoginDataManager: FirebaseLoginDataManagerProtocol {
    func makeLogin(email: String, password: String) async throws {
        try await apiClient.makeLogin(email: email, password: password)
    }
}
