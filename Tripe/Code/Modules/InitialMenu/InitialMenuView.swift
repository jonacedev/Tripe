//
//  InitalMenuView.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

struct InitialMenuView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: InitialMenuViewModel
    
    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            Text("InitialMenu View")
        }
    }
}

extension InitialMenuView {
  
}

#Preview {
    InitialMenuAssembly().build()
        .environmentObject(MainAppCoordinator())
}
