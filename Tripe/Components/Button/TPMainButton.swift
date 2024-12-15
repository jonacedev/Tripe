//
//  Untitled.swift
//  Tripe
//
//  Created by Mei De Blas on 12/12/24.
//

import SwiftUI

struct TPMainButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Text(title)
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

#Preview {
    TPMainButton(title: "Title") { }
}
