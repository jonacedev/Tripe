//
//  AboutApp.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

struct AboutAppView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @EnvironmentObject private var profileCoordinator : ProfileCoordinator

    @State var vm: AboutAppViewModel

    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
        .navigationBarHidden(true)
    }
    
    @ViewBuilder private func content() -> some View {
        navBar()
            .padding(.bottom,20)
        vwInfo()
        Spacer()
    }
    
    @ViewBuilder private func navBar() -> some View {
        SimpleNavBar(
            title: "about_app_title".localized,
            showBackButton: true,
            onBackButtonTap: {
                profileCoordinator.popToLast()
            }
        )
    }
    
    @ViewBuilder private func vwInfo() -> some View {
        VStack{
            List {
                ForEach(AboutAppViewModel.AboutAppSection.allCases, id: \.self) { section in
                    AppInfoCell(
                        title: section.title,
                        value: section.value)
                   
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

extension AboutAppView {
  
}

#Preview {
    AboutAppAssembly().build()
        .environmentObject(MainAppCoordinator())
        .environmentObject(ProfileCoordinator())
}

