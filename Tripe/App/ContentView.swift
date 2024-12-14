//
//  ContentView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI
import Combine
import FirebaseAuth

struct ContentView: View {
    @StateObject var mainAppCoordinator = MainAppCoordinator()
    @State private var cancellable: AnyCancellable?
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
        .onAppear {
            listenSessionChanges()
        }
        .onChange(of: splashLoaded) {
            checkUserSession()
        }
    }
    
    private func listenSessionChanges() {
        cancellable = UserSessionManager.shared.sessionPublisher
            .receive(on: RunLoop.main)
            .sink { userSession in
                if userSession != nil {
                    mainAppCoordinator.currentRoot = .tabBar
                } else {
                    mainAppCoordinator.currentRoot = .login
                }
            }
    }
    
    private func checkUserSession() {
        if let user = Auth.auth().currentUser {
            if AppleLoginHelper.shared.isAppleSession() {
                checkAppleSession(for: user)
            } else {
                UserSessionManager.shared.userSession = user
            }
        } else {
            UserSessionManager.shared.userSession = nil
        }
    }
    
    private func checkAppleSession(for user: FirebaseAuth.User) {
        AppleLoginHelper.shared.isValidAppleSession(success: {
            UserSessionManager.shared.userSession = user
        }, failure: {
            UserSessionManager.shared.userSession = nil
        })
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
