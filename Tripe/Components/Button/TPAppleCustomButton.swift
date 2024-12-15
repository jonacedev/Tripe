//
//  SMAppleCustomButton.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI

struct TPAppleCustomButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 8, height: 14, alignment: .center)
                Text("apple_btn_title".localized)
                    .font(.semiBoldTextSizeMOpenSans)
            }
            .frame(maxWidth: .infinity)
            .frame(height: BaseConstants.buttonDefaultHeight)
            .foregroundStyle(Color.white)
            .background(Color.primaryApp)
            .clipShape(.rect(cornerRadius: BaseConstants.cornerRadiusDefault))
        })
    }
}
