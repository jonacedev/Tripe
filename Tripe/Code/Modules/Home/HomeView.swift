//
//  HomeView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    @State var vm: HomeViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home View")
            Button("Navigate to profile") {
                homeCoordinator.push(.profile)
            }
        }
        .handleErrors(vm: vm)
    }
}

#Preview {
    HomeAssembly().build()
        .environmentObject(MainAppCoordinator())
        .environmentObject(HomeCoordinator())
}
