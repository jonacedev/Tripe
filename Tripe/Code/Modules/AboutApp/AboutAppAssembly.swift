//
//  AboutAppAssembly.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

class AboutAppAssembly {

    // MARK: - Private Functions

    func build() -> AboutAppView {
        let viewModel: AboutAppViewModel = AboutAppViewModel()
        return AboutAppView(vm: viewModel)
    }
}

extension AboutAppAssembly {
   
}
