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
        let viewModel: LoginViewModel = LoginViewModel()
        return LoginView(vm: viewModel)
    }
}

extension LoginAssembly {
   
}
