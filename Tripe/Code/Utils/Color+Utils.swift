//
//  Color.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI

public extension Color {

    private static func named(_ name: String) -> Color {
        Color(name)
    }
    
    // MARK: - Primary
    
    static let primaryApp = named("primaryColor")
    
    // MARK: - Inputs
    
    static let placeholderDefault = named("placeholderColor")
}
