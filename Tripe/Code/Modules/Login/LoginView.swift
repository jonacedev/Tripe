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
        .ignoresSafeArea(.keyboard)
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        Text("welcome_title".localized)
            .font(.semiBoldTextLargeTitleOpenSans)
    }
    
    @ViewBuilder private func vwInputs() -> some View {
        VStack(spacing: 35) {
            TPTextField(textfieldType: .normal, text: $vm.email, placeholder: "email_label_placeholder".localized, titleLabel: "email_label".localized)
            
            TPTextField(textfieldType: .secure, text: $vm.password, placeholder: "password_label_placeholder".localized, titleLabel: "password_label".localized)
        }
    }
    
    @ViewBuilder private func vwAccessButtons() -> some View {
        VStack(spacing: 35) {
            TPMainButton(title: "login_accept".localized) {
                makeLogin()
            }
            
            HStack(alignment: .center) {
                TPDivider()
                Text("other_label_title".localized)
                    .foregroundColor(Color.placeholder)
                    .padding(.horizontal, 10)
                TPDivider()
            }
            
            TPAppleCustomButton {
                vm.makeLoginWithApple()
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

extension LoginView {
    private func makeLogin() {
        Task {
            mainAppCoordinator.showLoading()
            await vm.makeLogin()
            mainAppCoordinator.hideLoading()
        }
    }
}

#Preview {
    LoginAssembly().build()
        .environmentObject(MainAppCoordinator())
}
