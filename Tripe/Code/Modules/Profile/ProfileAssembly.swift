//
//  LoginAssembly.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

class ProfileAssembly {

    // MARK: - Private Functions

    func build() -> ProfileView {
        let viewModel: ProfileViewModel = ProfileViewModel()
        return ProfileView(vm: viewModel)
    }
}

extension ProfileAssembly {
   
}
