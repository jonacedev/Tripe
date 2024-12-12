//
//  ErrorHandlerModifier 2.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI

struct LoadingControlModifier: ViewModifier {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: BaseViewModel
    
    func body(content: Content) -> some View {
        content
            .onChange(of: vm.isLoading) {
                if vm.isLoading {
                    mainAppCoordinator.showLoading()
                } else {
                    mainAppCoordinator.hideLoading()
                    vm.isLoading = false
                }
            }
    }
}

extension View {
    func handleLoader(vm: BaseViewModel) -> some View {
        self.modifier(LoadingControlModifier(vm: vm))
    }
}
