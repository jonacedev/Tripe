//
//  BaseErrorAlert.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import SwiftUI

struct BaseErrorAlert: View {
    var error: BaseError
    var onAccept: () -> Void
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                Text(error.description())
                    .font(.semiBoldTextSizeMOpenSans)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    onAccept()
                }, label: {
                    Text("button_ok".localized)
                        .font(.boldTextSizeMOpenSans)
                        .frame(maxWidth: .infinity)
                })
            }
            .padding(20)
            .foregroundColor(.white)
            .background(Color.primaryApp)
            .cornerRadius(BaseConstants.cornerRadiusDefault)
            .shadow(radius: 5)
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .ignoresSafeArea()
    }
}

#Preview {
    BaseErrorAlert(error: .generic, onAccept: { })
}
