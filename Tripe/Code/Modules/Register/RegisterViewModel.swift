//
//  RegisterViewModel.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import Foundation

@Observable
class RegisterViewModel: BaseViewModel {
    
    private var firebaseRegisterUseCase: FirebaseRegisterUseCaseProtocol
    
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var registerSuccess: Bool = false
    
    init(firebaseRegisterUseCase: FirebaseRegisterUseCaseProtocol) {
        self.firebaseRegisterUseCase = firebaseRegisterUseCase
    }
    
    @MainActor
    func registerUser() async {
        showLoading()
        do {
            try await firebaseRegisterUseCase.registerUser(email: email, password: password, username: username)
            registerSuccess = true
            hideLoading()
        } catch {
            presentError(error: .apiError(ErrorResponse(messageKey: error.localizedDescription), nil))
        }
       
    }
    
}
