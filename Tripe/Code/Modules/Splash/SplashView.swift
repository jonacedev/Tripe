//
//  ContentView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: SplashViewModel
    
    var body: some View {
        ZStack {
            Text("Splash")
                .font(.title)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        mainAppCoordinator.replaceRootWith(.login)
                    }
                }
        }
    }
}

#Preview {
    SplashAssembly().build()
        .environmentObject(MainAppCoordinator())
}
