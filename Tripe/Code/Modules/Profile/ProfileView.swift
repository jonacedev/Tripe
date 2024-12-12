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
        VStack {
            Text("Profile View")
            
            Button("closeSession".localized, action: {
                mainAppCoordinator.replaceRootWith(.login)
            })
        }
        .handleErrors(vm: vm)
    }
}

#Preview {
    ProfileAssembly().build()
        .environmentObject(MainAppCoordinator())
}
