//
//  TPDivider.swift
//  Tripe
//
//  Created by Mei De Blas on 13/12/24.
//

import SwiftUI

struct TPDivider: View {
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.dividerDefault)
            Text("o")
                .foregroundColor(Color.placeholderDefault)
                .padding(.horizontal, 10)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.dividerDefault)
        }
    }
}

#Preview {
    TPDivider()
}
