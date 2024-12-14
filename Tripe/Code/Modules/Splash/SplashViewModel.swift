//
//  SplashViewModel.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import Foundation
import FirebaseAuth

@Observable
class SplashViewModel: BaseViewModel {
    
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
        checkVersionUseCase.checkVersion(success: {
            self.checkJailbreak()
        }, failure: {
            self.forceUpdateAlert = true
        })
    }
    
    private func checkJailbreak() {
        if !DeviceInfo.isJailbreak() {
            successCheck = true
        } else {
            showJailbreakAlert = true
        }
    }
    
    
    func isUserSessionOpened() -> Bool {
        if let user = Auth.auth().currentUser {
            UserSessionManager.shared.userSession = user
            return true
        }
        return false
    }
}
