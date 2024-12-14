//
//  BaseView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI

struct BaseView<Content: View>: View {

    let content: () -> Content
    @State var vm: BaseViewModel

    var body: some View {
        content()
            .onTapHideKeyboard()
            .handleErrors(vm: vm)
    }
}
