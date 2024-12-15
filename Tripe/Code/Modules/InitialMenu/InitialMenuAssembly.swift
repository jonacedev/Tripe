//
//  InitialMenuAssembly.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

class InitialMenuAssembly {

    // MARK: - Private Functions

    func build() -> InitialMenuView {
        let viewModel: InitialMenuViewModel = InitialMenuViewModel()
        return InitialMenuView(initialMenuCoordinator: InitialMenuCoordinator(), vm: viewModel)
    }
}

extension InitialMenuAssembly {
   
}
