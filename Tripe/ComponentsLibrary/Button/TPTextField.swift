//
//  SMTextField.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI

struct TPTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .foregroundStyle(Color.placeholderDefault)
                .font(.regularTextSizeMOpenSans)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: BaseConstants.buttonDefaultHeight)
        .background(
            RoundedRectangle(cornerRadius: BaseConstants.cornerRadiusDefault)
                .stroke(Color.dividerDefault, lineWidth: BaseConstants.lineWidth)
        )
    }
}

#Preview {
    TPTextField(placeholder: "", text: .constant("example"))
}
