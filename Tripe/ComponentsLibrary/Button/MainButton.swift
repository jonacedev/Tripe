//
//  Untitled.swift
//  Tripe
//
//  Created by Mei De Blas on 12/12/24.
//
import SwiftUI
struct MainButton: View {
    
    let title: String
    
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity)
            .frame(height: BaseConstants.buttonDefaultHeight)
            .foregroundStyle(Color.white)
            .background(Color.black)
            .clipShape(.rect(cornerRadius: BaseConstants.cornerRadiusDefault))
        })
    }
}

#Preview {
    MainButton(title: "Title") {
        print("Main Button pressed")
    }
}
