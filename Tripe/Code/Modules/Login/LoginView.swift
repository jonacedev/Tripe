//
//  LoginView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    
    var body: some View {
        VStack {
            Button(action: {
                mainAppCoordinator.replaceRootWith(.register)
            }, label: {
                Text("Ir al registro")
            })
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
