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
    @Published var isDifferentLanguage: Bool = false
    
    override init() {
        self.selectedLanguage = LanguageManager.shared.currentAppLanguage
        super.init()
        loadSupportedLanguages()
        setIfIsDifferentLanguage()
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
    
    func setIfIsDifferentLanguage() {
        isDifferentLanguage = selectedLanguage != LanguageManager.shared.currentAppLanguage
    }
    
    func setSelectedLanguage(_ selectedLanguage: String) {
        self.selectedLanguage = selectedLanguage
        setIfIsDifferentLanguage()
    }
    
    func changeAppLanguage(to languageCode: String) {
        LanguageManager().changeAppLanguage(to: languageCode)
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
