//
//  SimpleNavBar.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import SwiftUI

struct SimpleNavBar: View {
    let title: String
    let showBackButton: Bool
    let onBackButtonTap: (() -> Void)?
    
    // TODO: center title
    
    var body: some View {
        VStack {
            HStack {
                if showBackButton {
                    Button(action: {
                        onBackButtonTap?()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.primaryApp)
                    }
                } else {
                    Spacer().frame(width: 44)
                }
                
                Spacer()
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Spacer().frame(width: 44)
                
            }
            .padding(.horizontal, 20)
            .background(Color(.systemBackground))
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.dividerDefault)
        }
    }
}

#Preview {
    SimpleNavBar(
        title: "Menú",
        showBackButton: true,
        onBackButtonTap: { print("Back tapped") }
    )
}
