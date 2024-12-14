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
        let viewModel: LoginViewModel = LoginViewModel(firebaseLoginUseCase: firebaseLoginUseCase)
        return LoginView(vm: viewModel)
    }
}

extension LoginAssembly {
    func createFirebaseLoginUseCase() -> FirebaseLoginUseCaseProtocol {
        let apiClient: FirebaseAuthAPIClientProtocol = FirebaseAuthAPIClient()
        let dataManager: FirebaseLoginDataManagerProtocol = FirebaseLoginDataManager(apiClient: apiClient)
        
        return FirebaseLoginUseCase(dataManager: dataManager)
    }
}
