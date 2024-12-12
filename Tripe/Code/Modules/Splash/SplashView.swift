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
    @State var animateLogo = false
    
    var body: some View {
        ZStack {
            Color.primaryApp
                .ignoresSafeArea()
            
            Image("tripeLogo")
                .resizable()
                .scaledToFit()
                .scaleEffect(animateLogo ? 1.2 : 1.0)
                .opacity(animateLogo ? 1.0 : 0.2)
                .animation(.easeIn(duration: 1), value: animateLogo)
        }
        .onAppear {
            animateLogo.toggle()
            vm.onAppear()
        }
        .onChange(of: vm.successCheck) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                mainAppCoordinator.replaceRootWith(.login)
            }
        }
        .alert(isPresented: $vm.showJailbreakAlert) {
            Alert(
                title: Text("jailbreak_title".localized),
                message: Text("jailbreak_description".localized),
                dismissButton: .default(Text("button_ok".localized), action: { exit(0)})
            )
        }
    }
}

#Preview {
    SplashAssembly().build()
        .environmentObject(MainAppCoordinator())
}
