//
//  LanguageViewModel.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import Foundation
import Combine
import SwiftUI

class LanguageViewModel: BaseViewModel, ObservableObject {
    @Published var languages: [LanguageOption] = []
    @Published var selectedLanguage: String

    override init() {
        self.selectedLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? "es"
        super.init()
        loadSupportedLanguages()
    }

    private func loadSupportedLanguages() {
        let supportedLocalizations = Bundle.main.localizations
        self.languages = supportedLocalizations.compactMap { code in
            guard let displayName = Locale.current.localizedString(forLanguageCode: code) else {
                return nil
            }
            return LanguageOption(name: displayName.capitalized, code: code)
        }
    }

    private var appLanguageKey = "AppleLanguages"

    func changeAppLanguage(to languageCode: String) {
        UserDefaults.standard.set([languageCode], forKey: appLanguageKey)
        UserDefaults.standard.synchronize()

        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") else {
            print("Language pack does not exist for: \(languageCode)")
            return
        }
        Bundle.setLanguage(path: path)

        NotificationCenter.default.post(name: .didChangeLanguage, object: nil)

        self.selectedLanguage = languageCode
    }
}


struct LanguageOption: Identifiable {
    let id: String
    let name: String
    let code: String
    
    init(name: String, code: String) {
        self.name = name
        self.code = code
        self.id = code
    }
}
