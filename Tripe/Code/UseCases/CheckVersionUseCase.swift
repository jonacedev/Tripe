//
//  SplashUseCase.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import Foundation

protocol CheckVersionUseCaseProtocol {
    func checkVersion(success: @escaping () -> Void, failure: @escaping () -> Void)
}

class CheckVersionUseCase {
    
    // MARK: - Properties
    
    private var dataManager: CheckVersionDataManagerProtocol
    
    // MARK: - Object lifecycle
    
    init(dataManager: CheckVersionDataManagerProtocol) {
        self.dataManager = dataManager
    }
}

extension CheckVersionUseCase: CheckVersionUseCaseProtocol {
    func checkVersion(success: @escaping () -> Void, failure: @escaping () -> Void) {
        dataManager.checkVersion(success: success, failure: failure)
    }
}
