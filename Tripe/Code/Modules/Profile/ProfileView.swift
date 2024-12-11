//
//  Profile.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    
    var body: some View {
        VStack {
            Text("Profile View")
            
            Button("Cerrar sesion", action: {
                mainAppCoordinator.replaceRootWith(.login)
            })
        }
    }
}

#Preview {
    ProfileView()
}
