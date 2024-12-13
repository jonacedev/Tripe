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
    
    @ViewBuilder private func vwAccessButtons() -> some View {
        VStack(spacing: 35) {
            TPMainButton(title: "login_accept".localized) {
                // TODO: WHEN REGISTER FINISHED REPLACE THIS WITH MAKE LOGIN FUNCTION
                mainAppCoordinator.replaceRootWith(.tabBar)
            }
           
            TPDivider()
            
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

extension LoginView {
    private func makeLogin() {
        Task {
            await vm.makeLogin()
            mainAppCoordinator.replaceRootWith(.tabBar)
        }
    }
}

#Preview {
    LoginAssembly().build()
        .environmentObject(MainAppCoordinator())
}
