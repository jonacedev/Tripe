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
        VStack {
            switch mainAppCoordinator.currentRoot {
            case .splash:
                SplashAssembly().build()
            case .login:
                LoginView()
            case .register:
                RegisterView()
            default:
                TabBarView()
            }
        }
        .environmentObject(mainAppCoordinator)
    }
}

#Preview {
    ContentView()
}
