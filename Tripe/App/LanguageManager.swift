//
//  LanguageManager.swift
//  Tripe
//
//  Created by Mei De Blas on 9/1/25.
//

import Foundation

class LanguageManager {
    
    static let shared = LanguageManager()
    let defaults = UserDefaults.standard
    let appLanguageKey = "AppLanguage"
    
    var currentAppLanguage: String { defaults.string(forKey: appLanguageKey) ?? "es"}

    func getDeviceLanguage() -> String {
        let deviceLanguage = Locale.current.language.languageCode?.identifier ?? "es"
        return deviceLanguage
    }
    
    func changeAppLanguage(to languageCode: String) {
        defaults.set(languageCode, forKey: appLanguageKey)
        
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") else {
            print("Language pack does not exist for: \(languageCode)")
            return
        }
        
        Bundle.setLanguage(path: path)

        NotificationCenter.default.post(name: .didChangeLanguage, object: nil)
    }
}
