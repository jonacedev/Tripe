//
//  BaseErrorAlert.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

struct BaseErrorAlert: View {
    var error: BaseError
    var onAccept: () -> Void
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                Text(error.description())
                
                Button(action: {
                    onAccept()
                }, label: {
                    Text("button_ok".localized)
                })
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.primaryApp)
            .cornerRadius(10)
            .shadow(radius: 5)
            
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4))
        .ignoresSafeArea()
    }
}

#Preview {
    BaseErrorAlert(error: .generic, onAccept: { })
}
