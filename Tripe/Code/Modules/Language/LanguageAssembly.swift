//
//  LanguageAssembly.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

class LanguageAssembly {

    // MARK: - Private Functions

    func build() -> LanguageView {
        let viewModel: LanguageViewModel = LanguageViewModel()
        return LanguageView(vm: viewModel)
    }
}

extension LanguageAssembly {
   
}
