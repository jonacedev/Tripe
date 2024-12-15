//
//  CustomSearchBar.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 15/12/24.
//

import SwiftUI

struct TPSearchBar: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.primaryApp)
                
                TextField(placeholder, text: $text)
                    .frame(height: BaseConstants.buttonDefaultHeight)
                    .foregroundStyle(Color.primaryApp)
                    .tint(.primaryApp)
                
                if text != "" {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.medium)
                        .foregroundColor(.primaryApp)
                        .onTapGesture {
                            withAnimation {
                                self.text = ""
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
            .background(Color.white)
        }
        .clipShape(.rect(cornerRadius: BaseConstants.cornerRadiusDefault))
    }
}

#Preview {
    TPSearchBar(text: .constant(""), placeholder: "search")
}
