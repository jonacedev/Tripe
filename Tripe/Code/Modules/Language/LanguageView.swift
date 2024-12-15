//
//  LanguageView.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

struct LanguageView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @StateObject private var initialMenuCoordinator = InitialMenuCoordinator()

    @State var vm: LanguageViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
        .navigationDestination(for: Screen.self) {
            $0.makeView()
        }
    }
    
    @ViewBuilder private func content() -> some View {
        navBar()
            .padding(.bottom, 20)
        vwOptions()
        vwHeader()
        Spacer()
    }
    
    @ViewBuilder private func navBar() -> some View {
        SimpleNavBar(
            title: "language_title".localized,
            showBackButton: true,
            onBackButtonTap: {
                dismiss()
            }
        )
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        HStack() {
            VStack(alignment: .leading){
                Text("subtitle_language".localized)
                    .font(.semiBoldTextSizeMOpenSans)
                    .padding(.bottom, 20)
                Text("Headline_language".localized)
                    .font(.regularTextSizeMOpenSans)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundStyle(Color.primaryApp)
    }
    
    @ViewBuilder private func vwOptions() -> some View {


    }
}



extension LanguageView {
  
}

#Preview {
    LanguageAssembly().build()
        .environmentObject(MainAppCoordinator())
}
