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
        let viewModel: RegisterViewModel = RegisterViewModel()
        return RegisterView(vm: viewModel)
    }
}

extension RegisterAssembly {
   
}
