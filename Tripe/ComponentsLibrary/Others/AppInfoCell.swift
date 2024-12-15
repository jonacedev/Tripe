//
//  AppInfoCell.swift
//  Tripe
//
//  Created by Mei De Blas on 15/12/24.
//
import SwiftUI

struct AppInfoCell: View {
    
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.regularTextSizeMOpenSans)
                .foregroundStyle(Color.secondary)
            Spacer()
            Text(value)
                .foregroundStyle(Color.primaryApp)
        }
    }
}
#Preview {
    AppInfoCell(title: "Operative system", value: "iOS 13.0")
}
