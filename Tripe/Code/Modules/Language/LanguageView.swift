//
//  LanguageView.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

struct LanguageView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: LanguageViewModel
    
    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            Text("LanguageView")
        }
    }
}

extension LanguageView {
  
}

#Preview {
    LanguageAssembly().build()
        .environmentObject(MainAppCoordinator())
}
