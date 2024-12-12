//
//  TabView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @StateObject private var homeCoordinator = HomeCoordinator()
    @StateObject private var profileCoordinator = ProfileCoordinator()
    
    var body: some View {
        TabView {
            NavigationStack(path: $homeCoordinator.path) {
                HomeAssembly().build()
                    .navigationDestination(for: Screen.self) {
                        $0.makeView()
                    }
            }
            .environmentObject(homeCoordinator)
            .tabItem {
                Label("house", systemImage: "house.fill")
            }
            
            NavigationStack(path: $profileCoordinator.path) {
                ProfileAssembly().build()
                    .navigationDestination(for: Screen.self) {
                        $0.makeView()
                    }
            }
            .environmentObject(profileCoordinator)
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
        .environmentObject(mainAppCoordinator)
    }
}

#Preview {
    TabBarView()
        .environmentObject(MainAppCoordinator())
}
