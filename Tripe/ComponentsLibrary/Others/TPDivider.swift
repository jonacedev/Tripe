//
//  TPDivider.swift
//  Tripe
//
//  Created by Mei De Blas on 13/12/24.
//

import SwiftUI

struct TPDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(Color.dividerDefault)
    }
}

#Preview {
    TPDivider()
}
