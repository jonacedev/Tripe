//
//  Profile.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: ProfileViewModel
    
    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            Text("Profile View")
            
            Button("closeSession".localized, action: {
                mainAppCoordinator.replaceRootWith(.login)
            })
        }
    }
}

#Preview {
    ProfileAssembly().build()
        .environmentObject(MainAppCoordinator())
}
