//
//  LoginView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: LoginViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
    }
    
    @ViewBuilder private func content() -> some View {
        VStack(spacing: 0) {
            vwHeader()
                .padding(.bottom, 70)
            vwInputs()
                .padding(.bottom, 40)
            vwAccessButtons()
                .padding(.bottom, 50)
            vwFooter()
            
            Spacer()
            
        }
        .padding(.horizontal, BaseConstants.generalPadding)
        .padding(.top, 70)
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        Text("welcome_title".localized)
            .font(.semiBoldTextLargeTitleOpenSans)
    }
    
    @ViewBuilder private func vwInputs() -> some View {
        VStack(spacing: 35) {
            VStack(alignment: .leading, spacing: 10) {
                Text("email_label".localized)
                    .font(.semiBoldTextSizeMOpenSans)
                
                TPTextField(placeholder: "email_label_placeholder".localized, text: $email)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("password_label".localized)
                    .font(.semiBoldTextSizeMOpenSans)
                
                TPSecureTextField(placeholder: "password_label_placeholder".localized, text: $password)
            }
        }
    }
    
    @ViewBuilder private func vwAccessButtons() -> some View {
        VStack(spacing: 35) {
            TPMainButton(title: "login_accept".localized) {
                print("")
            }
            
            HStack(alignment: .center) {
                //TODO: Crear componente TPDivider para no repetir codigo del rectangle
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
            
            TPAppleCustomButton {
                print("")
            }
        }
    }
    
    @ViewBuilder private func vwFooter() -> some View {
        HStack {
            Text("not_account_question".localized)
                .font(.boldTextSizeMOpenSans)
                .foregroundStyle(Color.primaryApp)
            
            Button(action: {
                mainAppCoordinator.replaceRootWith(.register)
            }, label: {
                Text("register_link".localized)
                    .foregroundStyle(Color.primaryApp)
                    .font(.boldTextSizeMOpenSans)
                    .underline()
            })
        }
    }
}

#Preview {
    LoginAssembly().build()
        .environmentObject(MainAppCoordinator())
}
