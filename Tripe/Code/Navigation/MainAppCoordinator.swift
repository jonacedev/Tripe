//
//  AppCoordinator.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

class MainAppCoordinator: ObservableObject {
    @Published var currentRoot: RootScreen = .splash
    @Published var error: BaseError?
    @Published var isLoading = false
    
    func replaceRootWith(_ root: RootScreen) {
        withAnimation {
            currentRoot = root
        }
    }
    
    func presentError(error: BaseError) {
        self.error = error
    }
    
    func hideError() {
        error = nil
    }
    
    func showLoading() {
        isLoading = true
    }
    
    func hideLoading() {
        isLoading = false
    }
}
