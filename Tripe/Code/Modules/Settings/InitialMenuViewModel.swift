//
//  SettingsViewModel.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import Foundation

@Observable
class SettingsViewModel: BaseViewModel {
    
    enum SettingsSection: CaseIterable {
        case language
        case aboutApp
        
        var title: String {
            switch self {
            case .language:
                return "language_title".localized
            case .aboutApp:
                return "about_app_title".localized
            }
        }
        
        var icon: String {
            switch self {
            case .language:
                return "globe"
            case .aboutApp:
                return "info.circle"
            }
        }
        
        var screen: Screen {
            switch self {
            case .language:
                return .language
            case .aboutApp:
                return .aboutApp
            }
        }
    }
}