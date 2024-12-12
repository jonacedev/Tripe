//
//  ErrorHandlerModifier.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI

struct ErrorHandlerModifier: ViewModifier {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: BaseViewModel
    
    func body(content: Content) -> some View {
        content
            .onChange(of: vm.showError) {
                if let error = vm.errorToShow {
                    mainAppCoordinator.presentError(error: error)
                    vm.resetError()
                }
            }
    }
}

extension View {
    func handleErrors(vm: BaseViewModel) -> some View {
        self.modifier(ErrorHandlerModifier(vm: vm))
    }
}
