//
//  InitalMenuView.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

struct InitialMenuView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
     @ObservedObject var initialMenuCoordinator: InitialMenuCoordinator
     @State var vm: InitialMenuViewModel
     @Environment(\.dismiss) var dismiss
    
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
            title: "menu_title".localized,
            showBackButton: true,
            onBackButtonTap: {
                dismiss()
            }
        )
    }
    
    @ViewBuilder private func vwOptions() -> some View {
        VStack {
            List {
                ForEach(InitialMenuViewModel.InitialMenuSection.allCases, id: \.self) { section in
                    InitialMenuOptionCell(
                        icon: section.icon,
                        title: section.title
                    ) {
                        //Print navigate to section
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

extension InitialMenuView {
    
}

#Preview {
    InitialMenuAssembly().build()
        .environmentObject(MainAppCoordinator())
}
