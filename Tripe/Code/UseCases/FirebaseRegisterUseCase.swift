//
//  FirebaseLoginUseCaseProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 13/12/24.
//

import Foundation

protocol FirebaseRegisterUseCaseProtocol {
    func registerUser(email: String, password: String, username: String) async throws
}

class FirebaseRegisterUseCase {
    
    // MARK: - Properties
    
    private var dataManager: FirebaseRegisterDataManagerProtocol
    
    // MARK: - Object lifecycle
    
    init(dataManager: FirebaseRegisterDataManagerProtocol) {
        self.dataManager = dataManager
    }
}

extension FirebaseRegisterUseCase: FirebaseRegisterUseCaseProtocol {
    func registerUser(email: String, password: String, username: String) async throws {
        try await dataManager.registerUser(email: email, password: password, username: username)
    }
}
