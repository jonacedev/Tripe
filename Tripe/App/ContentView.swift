//
//  ContentView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mainAppCoordinator = MainAppCoordinator()
    @State private var splashLoaded: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                switch mainAppCoordinator.currentRoot {
                case .splash:
                    SplashAssembly().build(splashLoaded: $splashLoaded)
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
            loader()
        }
        .onReceive(UserSessionManager.shared.sessionPublisher) { userSession in
            mainAppCoordinator.currentRoot = userSession != nil ? .tabBar : .login
        }
        .onChange(of: splashLoaded) {
            UserSessionManager.shared.checkUserSession()
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
    
    @ViewBuilder func loader() -> some View {
        if mainAppCoordinator.isLoading {
            BaseLoader()
        }
    }
}

#Preview {
    ContentView()
}
