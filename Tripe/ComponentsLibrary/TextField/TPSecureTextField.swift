//
//  SMSecureTextField.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import SwiftUI

struct TPSecureTextField: View {
    var placeholder: String
    @Binding var text: String
    @State var isSecure: Bool = true
    
    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .foregroundStyle(Color.placeholderDefault)
            .font(.regularTextSizeMOpenSans)
            .padding(.horizontal)
            
           
            Button(action: {
                isSecure = !isSecure
            }, label: {
                Image(systemName: !isSecure ? "eye.slash" : "eye")
                    .foregroundStyle(Color.primaryApp)
                    .padding()
            })
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: BaseConstants.buttonDefaultHeight)
        .background(
            RoundedRectangle(cornerRadius: BaseConstants.cornerRadiusDefault)
                .stroke(Color.dividerDefault, lineWidth: BaseConstants.lineWidth)
        )
        .animation(.easeInOut(duration: 0.3), value: isSecure)
    }
}

#Preview {
    TPSecureTextField(placeholder: "", text: .constant("example"))
}
