//
//  SplashAssembly.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

class HomeAssembly {
    
    // MARK: - Private Functions
    
    func build() -> HomeView {
        let viewModel: HomeViewModel = HomeViewModel()
        return HomeView(vm: viewModel)
    }
}

extension SplashAssembly {
    
}
