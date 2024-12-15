//
//  Screen.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import Foundation
import SwiftUI

protocol ScreenProtocol {
    associatedtype ScreenView: View
    @ViewBuilder func makeView() -> ScreenView
}

enum Screen: ScreenProtocol {
    case home
    case profile
    case initialMenu
    case language
    
    
    @ViewBuilder func makeView() -> some View {
        switch self {
        case .home:
            HomeAssembly().build()
        case .profile:
            ProfileAssembly().build()
        case .language:
            LanguageAssembly().build()
        case .initialMenu:
            InitialMenuAssembly().build()
        }
    }
}
