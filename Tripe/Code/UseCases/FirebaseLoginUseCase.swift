//
//  CheckVersionUseCaseProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 13/12/24.
//

import Foundation

protocol FirebaseLoginUseCaseProtocol {
    func makeLogin(email: String, password: String) async throws
}

class FirebaseLoginUseCase {
    
    // MARK: - Properties
    
    private var dataManager: FirebaseLoginDataManagerProtocol
    
    // MARK: - Object lifecycle
    
    init(dataManager: FirebaseLoginDataManagerProtocol) {
        self.dataManager = dataManager
    }
}

extension FirebaseLoginUseCase: FirebaseLoginUseCaseProtocol {
    func makeLogin(email: String, password: String) async throws {
        try await dataManager.makeLogin(email: email, password: password)
    }
}
