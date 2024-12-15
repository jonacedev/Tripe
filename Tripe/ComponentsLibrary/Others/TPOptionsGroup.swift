//
//  TPOptionsGroup.swift
//  Tripe
//
//  Created by Mei De Blas on 15/12/24.
//

import SwiftUI

struct RadioButtonGroup<Option: Identifiable>: View {
    let options: [Option]
    let selectedOption: Option.ID
    let onSelectionChange: (Option.ID) -> Void
    let displayOption: (Option) -> String
    
    var body: some View {
        VStack {
            ForEach(options) { option in
                RadioButtonOption(
                    title: displayOption(option),
                    isSelected: option.id == selectedOption
                )
                .onTapGesture {
                    onSelectionChange(option.id)
                }
            }
        }
    }
}

struct RadioButtonOption: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .foregroundColor(.black)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: BaseConstants.cornerRadiusDefault)
                    .stroke(Color.black, lineWidth: isSelected ? 5 : 1)
            )
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: BaseConstants.cornerRadiusDefault))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
    }
}
