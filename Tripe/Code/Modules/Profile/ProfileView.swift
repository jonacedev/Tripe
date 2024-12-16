//
//  Profile.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @EnvironmentObject private var profileCoordinator : ProfileCoordinator

    @State var vm: ProfileViewModel
    
    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            
            vwHeader()
            
            Spacer()
            
            Text("Profile View")
            
            Button("closeSession".localized, action: {
                closeSession()
            })
        }
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        HStack{
            Spacer()
            
            Button {
                profileCoordinator.push(.settings)
            } label: {
                Image(systemName: "gear")
                    .foregroundStyle(Color.primaryApp)
            }
            .padding()
        }
    }
}

extension ProfileView {
    private func closeSession() {
        Task {
            mainAppCoordinator.showLoading()
            await vm.closeSession()
            mainAppCoordinator.hideLoading()
        }
    }
    
    private func navigateSettings() {
        profileCoordinator.push(.settings)
    }
}

#Preview {
    ProfileAssembly().build()
        .environmentObject(MainAppCoordinator())
        .environmentObject(ProfileCoordinator())
}
