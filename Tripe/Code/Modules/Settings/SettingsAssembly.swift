//
//  SettingsAssembly.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

class SettingsAssembly {

    // MARK: - Private Functions

    func build() -> SettingsView {
        let viewModel: SettingsViewModel = SettingsViewModel()
        return SettingsView(vm: viewModel)
    }
}

extension SettingsAssembly {
   
}
