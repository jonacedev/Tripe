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
    
    var showJailbreakAlert = false
    var forceUpdateAlert = false
    var successCheck = false
    
    // MARK: - Object lifecycle
    
    init(checkVersionUseCase: CheckVersionUseCaseProtocol) {
        self.checkVersionUseCase = checkVersionUseCase
    }
    
    func onAppear() {
        checkDevice()
    }
        
    private func checkDevice() {
        if DeviceInfo.isSimulator() || !DeviceInfo.isJailbreak() {
            successCheck = true
        } else {
            showJailbreakAlert = true
        }
    }
}
