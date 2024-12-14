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
        .padding(.top, 0)
        .onChange(of: vm.loginSuccess) {
            mainAppCoordinator.replaceRootWith(.tabBar)
        }
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        HStack{
            Spacer()
            
            Button {
                print("Ir a menú incial")
            } label: {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(Color.primaryApp)
            }
        }
        
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
                makeLogin()
            }
           
            HStack(alignment: .center) {
                TPDivider()
                Text("other_label_title".localized)
                    .foregroundColor(Color.placeholderDefault)
                    .padding(.horizontal, 10)
                TPDivider()
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

extension LoginView {
    private func makeLogin() {
        Task {
            await vm.makeLogin()
        }
    }
}

#Preview {
    LoginAssembly().build()
        .environmentObject(MainAppCoordinator())
}
