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
        BaseView(
            content: content,
            vm: vm
        )
    }
    
    @ViewBuilder private func content() -> some View {
        VStack(spacing: 20) {
            Text("Home View")
                .font(.regularTextSizeMOpenSans)
            
            Button("Navigate to profile") {
                homeCoordinator.push(.profile)
            }
        }
        .padding(.horizontal, BaseConstants.generalPadding)
    }
}

#Preview {
    HomeAssembly().build()
        .environmentObject(MainAppCoordinator())
        .environmentObject(HomeCoordinator())
}
