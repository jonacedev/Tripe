//
//  FirebaseLoginUseCaseProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 14/12/24.
//

import Foundation

protocol FirebaseAppleLoginUseCaseProtocol {
    func makeLoginWithApple()
}

class FirebaseAppleLoginUseCase {
    
    // MARK: - Properties
    
    private var dataManager: FirebaseAppleLoginDataManagerProtocol
    
    // MARK: - Object lifecycle
    
    init(dataManager: FirebaseAppleLoginDataManagerProtocol) {
        self.dataManager = dataManager
    }
}

extension FirebaseAppleLoginUseCase: FirebaseAppleLoginUseCaseProtocol {
    func makeLoginWithApple() {
        dataManager.makeLoginWithApple()
    }
}
