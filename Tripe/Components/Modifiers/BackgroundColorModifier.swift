//
//  ErrorHandlerModifier 2.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 17/12/24.
//

import SwiftUI

struct BackgroundColorModifier: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        ZStack {
            color
                .ignoresSafeArea()
            content
        }
    }
}

extension View {
    func setBackground(_ color : Color) -> some View {
        self.modifier(BackgroundColorModifier(color: color))
    }
}
