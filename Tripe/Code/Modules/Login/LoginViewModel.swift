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
    var email: String = ""
    var password: String = ""
    
    // MARK: - Object lifecycle
    
    init(firebaseLoginUseCase: FirebaseLoginUseCaseProtocol) {
        self.firebaseLoginUseCase = firebaseLoginUseCase
    }
    
    @MainActor
    func makeLogin() async {
        showLoading()
        do {
            try await firebaseLoginUseCase.makeLogin(email: email, password: password)
            hideLoading()
        } catch {
            presentError(error: .apiError(ErrorResponse(messageKey: error.localizedDescription), nil))
        }
    }
}
