//
//  BaseErrorHandlerModifier 2.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI

struct OnTapHideKeyboardModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
        }
        .contentShape(Rectangle())
        .highPriorityGesture(TapGesture().onEnded({
            hideKeyboard()
        }))
        
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func onTapHideKeyboard() -> some View {
        self.modifier(OnTapHideKeyboardModifier())
    }
}
