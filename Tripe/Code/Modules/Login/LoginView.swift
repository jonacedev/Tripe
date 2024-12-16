//
//  LoginView.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

struct LoginView: View {
      @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
      @StateObject private var initialMenuCoordinator = InitialMenuCoordinator()
      @State var vm: LoginViewModel
    
    var body: some View {
          NavigationStack(path: $initialMenuCoordinator.path) {
              BaseView(
                  content: content,
                  vm: vm
              )
              .navigationDestination(for: Screen.self) {
                  $0.makeView()
              }
          }
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
        .ignoresSafeArea(.keyboard)
        
    }
    
    @ViewBuilder private func vwHeader() -> some View {
        HStack{
            Spacer()
            
            Button {
                initialMenuCoordinator.push(.initialMenu)
            } label: {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(Color.primaryApp)
            }
        }
        
        Text("welcome_title".localized)
            .font(.semiBoldTextLargeTitleOpenSans)
    }
    
    @ViewBuilder private func vwInputs() -> some View {
        VStack(spacing: 40) {
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
        .environmentObject(InitialMenuCoordinator())
}
