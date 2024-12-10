//
//  SplashViewModel.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import Foundation

@Observable
class SplashViewModel {
    
    // MARK: - Properties
    
    private var checkVersionUseCase: CheckVersionUseCaseProtocol
    
    // MARK: - Object lifecycle
    
    init(checkVersionUseCase: CheckVersionUseCaseProtocol) {
        self.checkVersionUseCase = checkVersionUseCase
    }
}
