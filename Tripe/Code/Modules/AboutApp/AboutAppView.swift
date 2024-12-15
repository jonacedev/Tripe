//
//  AboutApp.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

struct AboutAppView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: AboutAppViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
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
                dismiss()
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
}

