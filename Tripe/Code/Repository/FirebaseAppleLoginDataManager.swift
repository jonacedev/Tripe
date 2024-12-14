//
//  FirebaseLoginDataManagerProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 14/12/24.
//

protocol FirebaseAppleLoginDataManagerProtocol {
    func makeLoginWithApple()
}

class FirebaseAppleLoginDataManager {
    
    // MARK: - Properties
    
    private var apiClient: FirebaseAuthAPIClientProtocol
    
    // MARK: - Object lifecycle
    
    init(apiClient: FirebaseAuthAPIClientProtocol) {
        self.apiClient = apiClient
    }
}

extension FirebaseAppleLoginDataManager: FirebaseAppleLoginDataManagerProtocol {
    func makeLoginWithApple() {
        apiClient.makeLoginWithApple()
    }
}
