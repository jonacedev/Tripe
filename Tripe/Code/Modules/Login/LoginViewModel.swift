//
//  LoginViewModel.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import Foundation

@Observable
class LoginViewModel: BaseViewModel {
    
    private var firebaseLoginUseCase: FirebaseLoginUseCaseProtocol
    private var firebaseAppleLoginUseCase: FirebaseAppleLoginUseCaseProtocol
    
    var email: String = ""
    var password: String = ""
    
    // MARK: - Object lifecycle
    
    init(firebaseLoginUseCase: FirebaseLoginUseCaseProtocol, firebaseAppleLoginUseCase: FirebaseAppleLoginUseCaseProtocol) {
        self.firebaseLoginUseCase = firebaseLoginUseCase
        self.firebaseAppleLoginUseCase = firebaseAppleLoginUseCase
    }
    
    @MainActor
    func makeLogin() async {
        do {
            try await firebaseLoginUseCase.makeLogin(email: email, password: password)
        } catch {
            presentError(error: .apiError(ErrorResponse(messageKey: error.localizedDescription), nil))
        }
    }
    
    @MainActor
    func makeLoginWithApple() {
        firebaseAppleLoginUseCase.makeLoginWithApple()
    }
}
