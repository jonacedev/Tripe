import SwiftUI

struct LanguageView: View {
    @EnvironmentObject var mainAppCoordinator: MainAppCoordinator
    @EnvironmentObject private var profileCoordinator : ProfileCoordinator
    @State var vm: LanguageViewModel
    @Environment(\.dismiss) var dismiss

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
                dismiss()
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
        TPMainButton(title: "button_ok".localized, action: {
            vm.changeAppLanguage(to: vm.selectedLanguage)
            vm.setIfIsDifferentLanguage()
        }, isDisabled: !vm.isDifferentLanguage)
        .padding(20)
    }
}

#Preview {
    LanguageAssembly().build()
        .environmentObject(MainAppCoordinator())
        .environmentObject(ProfileCoordinator())
}
