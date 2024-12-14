//
//  RegisterView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @State var vm: RegisterViewModel
    
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
            vwAccessButton()
                .padding(.bottom, 40)
            TPDivider()
                .padding(.bottom, 40)
            vwFooter()
                .padding(.bottom, 40)
            
            Spacer()
        }
        .padding(.horizontal, BaseConstants.generalPadding)
        .padding(.top, 70)
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        Text("register_title")
            .font(.semiBoldTextLargeTitleOpenSans)
    }
    
    @ViewBuilder private func vwInputs() -> some View {
        VStack(spacing: 35) {
            VStack(alignment: .leading, spacing: 10) {
                Text("username_label".localized)
                    .font(.semiBoldTextSizeMOpenSans)
                
                TPTextField(
                    placeholder: "username_label_placeholder".localized,
                    text: $vm.username
                )
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("email_label".localized)
                    .font(.semiBoldTextSizeMOpenSans)
                
                TPTextField(
                    placeholder: "email_label_placeholder".localized,
                    text: $vm.email
                )
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("password_label".localized)
                    .font(.semiBoldTextSizeMOpenSans)
                
                TPSecureTextField(
                    placeholder: "password_label_placeholder".localized,
                    text: $vm.password
                )
            }
        }
    }
    
    @ViewBuilder private func vwAccessButton() -> some View {
        VStack(spacing: 35) {
            TPMainButton(title: "continue_label".localized) {
                registerUser()
            }
        }
    }
    
    @ViewBuilder private func vwFooter() -> some View {
        HStack {
            Text("already_have_account_question".localized)
                .font(.boldTextSizeMOpenSans)
                .foregroundStyle(Color.primaryApp)
            
            Button(action: {
                mainAppCoordinator.replaceRootWith(.login)
            }, label: {
                Text("login_link".localized)
                    .foregroundStyle(Color.primaryApp)
                    .font(.boldTextSizeMOpenSans)
                    .underline()
            })
        }
    }
}

extension RegisterView {
    private func registerUser() {
        Task {
            mainAppCoordinator.showLoading()
            await vm.registerUser()
            mainAppCoordinator.hideLoading()
        }
    }
}

#Preview {
    RegisterAssembly().build()
        .environmentObject(MainAppCoordinator())
}
