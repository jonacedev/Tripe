//
//  InitalMenuView.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @EnvironmentObject private var profileCoordinator : ProfileCoordinator
    @State var vm: SettingsViewModel
    
    
    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
    }
    
    @ViewBuilder private func content() -> some View {
        navBar()
        vwOptions()
    }
    
    @ViewBuilder private func navBar() -> some View {
        SimpleNavBar(
            title: "settings_title".localized,
            showBackButton: true,
            onBackButtonTap: {
                profileCoordinator.popToLast()
            }
        )
    }
    
    @ViewBuilder private func vwOptions() -> some View {
        VStack {
            List {
                ForEach(SettingsViewModel.SettingsSection.allCases, id: \.self) { section in
                    SettingsOption(
                        icon: section.icon,
                        title: section.title
                    ) {
                        profileCoordinator.push(section.screen)
                        
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(PlainListStyle())
        }
        .padding(.horizontal, 10)
        .navigationBarHidden(true)
    }
}

extension SettingsView {
    
}

#Preview {
    SettingsAssembly().build()
        .environmentObject(MainAppCoordinator())
        .environmentObject(ProfileCoordinator())
}
