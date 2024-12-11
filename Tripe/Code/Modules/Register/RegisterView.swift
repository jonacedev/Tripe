//
//  RegisterView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                mainAppCoordinator.replaceRootWith(.tabBar)
            }, label: {
                Text("Ir al home")
            })
            
            Button(action: {
                mainAppCoordinator.replaceRootWith(.login)
            }, label: {
                Text("Ir al login")
            })
        }
        .padding()
    }
}

#Preview {
    RegisterView()
}
