//
//  LoginView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: LoginViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                // Forzar un crash para Crashlytics
                fatalError("Forzado de crash para pruebas de Crashlytics.")
                
                // Navegación al registro
                // mainAppCoordinator.replaceRootWith(.register)
            }, label: {
                Text("Ir al registro")
            })
        }
        .handleErrors(vm: vm)
    }
}

#Preview {
    LoginAssembly().build()
        .environmentObject(MainAppCoordinator())
}
