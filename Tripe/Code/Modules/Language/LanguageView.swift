import SwiftUI

struct LanguageView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @EnvironmentObject private var profileCoordinator : ProfileCoordinator
    @State var vm: LanguageViewModel

    var body: some View {
        BaseView(
            content: content,
            vm: vm
        )
        .navigationBarHidden(true)
    }

    @ViewBuilder private func content() -> some View {
        navBar()
            .padding(.bottom, 20)
        vwHeader()
            .padding(.bottom, 20)
        vwOptions()
        Spacer()
        vwConfirm()
    }

    @ViewBuilder private func navBar() -> some View {
        SimpleNavBar(
            title: "language_title".localized,
            showBackButton: true,
            onBackButtonTap: {
                profileCoordinator.popToLast()
            }
        )
    }

    @ViewBuilder private func vwHeader() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("subtitle_language".localized)
                    .font(.semiBoldTextSizeMOpenSans)
                    .padding(.bottom, 20)
                Text("Headline_language".localized)
                    .font(.regularTextSizeMOpenSans)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundStyle(Color.primaryApp)
    }

    @ViewBuilder private func vwOptions() -> some View {
        RadioButtonGroup(
            options: vm.languages,
            selectedOption: vm.selectedLanguage,
            onSelectionChange: { newSelection in
                vm.setSelectedLanguage(newSelection)
                vm.setIfIsDifferentLanguage()
            },
            displayOption: { $0.name }
        )
    }

    @ViewBuilder private func vwConfirm() -> some View {
        TPMainButton(title: "imprimir!") {
            print("---------------")
            print("Idioma app ahora:")
            print(vm.currentAppLanguage)
            print("opcion seleccionada:")
            print(vm.selectedLanguage)
            print("es diferente idioma:")
            print(vm.isDifferentLanguage)
        }
        
        TPMainButton(title: "button_ok".localized, action: {
            btConfirmedTapped()
        }, isDisabled: !vm.isDifferentLanguage)
        .padding(20)
    }
}

extension LanguageView {
    private func btConfirmedTapped(){
        vm.changeAppLanguage(to: vm.selectedLanguage)
        vm.setIfIsDifferentLanguage()
//        profileCoordinator.popToLast()
    }
}

#Preview {
    LanguageAssembly().build()
        .environmentObject(MainAppCoordinator())
        .environmentObject(ProfileCoordinator())
}
