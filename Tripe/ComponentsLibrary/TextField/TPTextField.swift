//
//  PrimaryTextField.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 15/12/24.
//

import SwiftUI

public enum TPTextFieldType {
    case normal
    case secure
}

// MARK: For future error implementation if needed
public enum TPTextfieldInfoLabelType: Hashable {
    case none
    case error(String?)
}

public struct TPTextField: View {
    
    // MARK: - Properties
    
    @FocusState private var isFocused: Bool
    @State private var textfieldType: TPTextFieldType
    @State private var isSecured: Bool = true
    @State private var isError: Bool = false
    @Environment(\.isEnabled) private var isEnabled
 
    @Binding private var text: String
   
    private var placeholder: String
    private var titleLabel: String
    private var lineWidthColor: Color {
        isFocused ? .primaryApp : .placeholderDefault
    }
   
    public init(
        textfieldType: TPTextFieldType,
        isFocused: Bool = false,
        text: Binding<String>,
        placeholder: String,
        titleLabel: String
    ) {
        self.textfieldType = textfieldType
        
        switch textfieldType {
        case .normal:
            isSecured = false
        case .secure:
            isSecured = true
        }
        self._text = text
        self.placeholder = placeholder
        self.titleLabel = titleLabel
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            labelTitle()
            
            ZStack(alignment: .trailing) {
                textField()
                    .tint(Color.primaryApp)
                    .foregroundColor(Color.primaryApp)
                    .font(Font.regularTextSizeMOpenSans)
                
                addSideButton()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: BaseConstants.buttonDefaultHeight)
            .background {
                RoundedRectangle(cornerRadius: BaseConstants.cornerRadiusDefault)
                    .fill(.white)
            }
            .overlay {
                RoundedRectangle(cornerRadius: BaseConstants.cornerRadiusDefault)
                    .stroke(
                        isError ? .red : lineWidthColor,
                        lineWidth: BaseConstants.lineWidth
                    )
            }
        }
    }
}

private extension TPTextField {
    
    @ViewBuilder func labelTitle() -> some View {
        Text(titleLabel)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.regularTextSizeMOpenSans)
            .foregroundColor(Color.primaryApp)
            .padding(.bottom, 8)
    }
    
    @ViewBuilder func textField() -> some View {
        if isSecured {
            SecureField("",
                        text: $text,
                        prompt: placeholderText()
            )
            .focused($isFocused)
        } else {
            TextField("",
                      text: $text,
                      prompt: placeholderText()
            )
            .focused($isFocused)
        }
    }
    
    func placeholderText() -> Text {
        Text(placeholder)
            .foregroundStyle(Color.placeholderDefault)
            .font(.regularTextSizeMOpenSans)
    }
    
    @ViewBuilder func addSideButton() -> some View {
        switch textfieldType {
        case .normal:
            EmptyView()
        case .secure:
            Button(action: {
                isSecured.toggle()
            }) {
                Image(isSecured ? "showPasswd" : "hidePasswd")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .foregroundStyle(Color.primaryApp)
                    .contentShape(Rectangle())
            }
        }
    }
}
