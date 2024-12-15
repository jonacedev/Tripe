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
        ZStack {
            Color(uiColor: .systemGray6).opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                vwHeader()
                    .padding(.top, 20)
                TPSearchBar(text: $vm.searchText, placeholder: "searchbar_placeholder".localized)
                
                Spacer()
            }
            .padding(.horizontal, BaseConstants.generalPadding)
        }
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("greeting_title".localized)
                    .font(.regularTextSizeH3OpenSans)
                Text("Roberto")
                    .font(.semiBoldTextSizeH3OpenSans)
            }
            Spacer()
            Image("profile_user_mock")
                .resizable()
                .scaledToFill()
                .clipShape(.circle)
                .frame(width: 55, height: 55)
        }
    }
}

#Preview {
    HomeAssembly().build()
}
