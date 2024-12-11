//
//  HomeCoordinator.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

class HomeCoordinator: ObservableObject, NavigationManagerProtocol {
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
