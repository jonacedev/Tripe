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
    
    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            Text("AboutApp View")
        }
    }
}

extension AboutAppView {
  
}

#Preview {
    AboutAppAssembly().build()
        .environmentObject(MainAppCoordinator())
}
