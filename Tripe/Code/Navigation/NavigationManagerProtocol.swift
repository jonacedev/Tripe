//
//  NavigationManagerProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

protocol NavigationManagerProtocol: ObservableObject {
    var path: NavigationPath { get set }
    func push(_ screen: Screen)
    func popToRoot()
    func popToLast()
}
