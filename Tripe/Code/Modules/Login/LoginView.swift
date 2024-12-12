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
        VStack(spacing: 20) {
            
            Text("welcome_title".localized)
                .font(.semiBoldTextLargeTitleOpenSans)
                .padding(.top, 40)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                    .font(.headline)
                TextField("Introduce tu email", text: .constant(""))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Contraseña")
                    .font(.headline)
                TextField("Introduce tu contraseña", text: .constant(""))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .padding(.vertical, 10)
            
            MainButton(title: "login_accept".localized) {
                print("")
            }
            
            HStack {
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                Text("o")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            
            TPAppleCustomButton {
                print("")
            }
            
            HStack {
                Text("¿Aún no tienes cuenta?")
                Button(action: {
                    mainAppCoordinator.replaceRootWith(.register)
                }, label: {
                    Text("Regístrate")
                        .foregroundStyle(.black)
                        .underline()
                })
            }
            .bold()
            .padding(.vertical, 20)
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    LoginAssembly().build()
        .environmentObject(MainAppCoordinator())
}
