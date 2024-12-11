//
//  HomeView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    
    var body: some View {
        VStack {
            Text("Home View")
            Button("Navigate to profile", action: {
                homeCoordinator.push(.profile)
            })
        }
    }
}

#Preview {
    HomeView()
}
