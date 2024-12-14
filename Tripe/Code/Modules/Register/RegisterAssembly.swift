//
//  ProfileAssembly.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//


import SwiftUI

class RegisterAssembly {
    
    // MARK: - Private Functions
    
    func build() -> RegisterView {
        let firebaseRegisterUseCase = createFirebaseRegisterUseCase()
        let viewModel: RegisterViewModel = RegisterViewModel(firebaseRegisterUseCase: firebaseRegisterUseCase)
        return RegisterView(vm: viewModel)
    }
}

extension RegisterAssembly {
    func createFirebaseRegisterUseCase() -> FirebaseRegisterUseCaseProtocol {
        let apiClient: FirebaseAuthAPIClientProtocol = FirebaseAuthAPIClient()
        let dataManager: FirebaseRegisterDataManagerProtocol = FirebaseRegisterDataManager(apiClient: apiClient)
        
        return FirebaseRegisterUseCase(dataManager: dataManager)
    }
}
