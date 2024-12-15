//
//  InitialMenuCoordinator.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//
import SwiftUI

class InitialMenuCoordinator: ObservableObject, NavigationManagerProtocol {
    @Published var path: NavigationPath = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func popToLast() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
}
