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
    let isDisabled: Bool
    
    init(title: String, action: @escaping () -> Void, isDisabled: Bool = false) {
        self.title = title
        self.action = action
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        Button(action: {
            if !isDisabled {
                action()
            }
        }, label: {
            HStack {
                Text(title)
                    .font(.semiBoldTextSizeMOpenSans)
            }
            .frame(maxWidth: .infinity)
            .frame(height: BaseConstants.buttonDefaultHeight)
            .foregroundStyle(isDisabled ? Color.gray : Color.white)
            .background(isDisabled ? Color.gray.opacity(0.6) : Color.primaryApp)
            .clipShape(.rect(cornerRadius: BaseConstants.cornerRadiusDefault))
            .opacity(isDisabled ? 0.6 : 1)
        })
        .disabled(isDisabled)
    }
}

#Preview {
    TPMainButton(title: "Title", action: { })
}
