//
//  ContentView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mainAppCoordinator = MainAppCoordinator()
    
    var body: some View {
        ZStack {
            VStack {
                switch mainAppCoordinator.currentRoot {
                case .splash:
                    SplashAssembly().build()
                case .login:
                    LoginAssembly().build()
                case .register:
                    RegisterAssembly().build()
                default:
                    TabBarView()
                }
            }
            .environmentObject(mainAppCoordinator)
            
            errorAlert()
        }
    }
}

private extension ContentView {
    @ViewBuilder func errorAlert() -> some View {
        if let error = mainAppCoordinator.error {
            BaseErrorAlert(error: error, onAccept: {
                mainAppCoordinator.hideError()
            })
        }
    }
}

#Preview {
    ContentView()
}
