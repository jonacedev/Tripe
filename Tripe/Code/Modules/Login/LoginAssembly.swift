//
//  HomeAssembly.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

class LoginAssembly {
    
    // MARK: - Private Functions
    
    func build() -> LoginView {
        let firebaseLoginUseCase = createFirebaseLoginUseCase()
        let firebaseAppleLoginUseCase = createFirebaseAppleLoginUseCase()
        let viewModel: LoginViewModel = LoginViewModel(firebaseLoginUseCase: firebaseLoginUseCase, firebaseAppleLoginUseCase: firebaseAppleLoginUseCase)
        return LoginView(vm: viewModel)
    }
}

extension LoginAssembly {
    func createFirebaseLoginUseCase() -> FirebaseLoginUseCaseProtocol {
        let apiClient: FirebaseAuthAPIClientProtocol = FirebaseAuthAPIClient()
        let dataManager: FirebaseLoginDataManagerProtocol = FirebaseLoginDataManager(apiClient: apiClient)
        
        return FirebaseLoginUseCase(dataManager: dataManager)
    }
    
    func createFirebaseAppleLoginUseCase() -> FirebaseAppleLoginUseCaseProtocol {
        let apiClient: FirebaseAuthAPIClientProtocol = FirebaseAuthAPIClient()
        let dataManager: FirebaseAppleLoginDataManagerProtocol = FirebaseAppleLoginDataManager(apiClient: apiClient)
        
        return FirebaseAppleLoginUseCase(dataManager: dataManager)
    }
}
