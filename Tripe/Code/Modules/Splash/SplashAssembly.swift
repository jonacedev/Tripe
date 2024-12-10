//
//  SplashAssembly.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

class SplashAssembly {

    // MARK: - Private Functions

    private func build() -> SplashView {
        let checkVersionUseCase = createCheckVersionUseCase()
        let viewModel: SplashViewModel = SplashViewModel(checkVersionUseCase: checkVersionUseCase)
        return SplashView(vm: viewModel)
    }

    func preview() -> some View {
        build()
    }
}

extension SplashAssembly {
    func createCheckVersionUseCase() -> CheckVersionUseCaseProtocol {
        let apiClient: CheckVersionAPIClientProtocol = CheckVersionAPIClient()
        let dataManager: CheckVersionDataManagerProtocol = CheckVersionDataManager(apiClient: apiClient)
        
        return CheckVersionUseCase(dataManager: dataManager)
    }
}
