//
//  AboutAppViewModel.swift
//  Tripe
//
//  Created by Mei De Blas on 14/12/24.
//

import Foundation

@Observable
class AboutAppViewModel: BaseViewModel {
    enum AboutAppSection: CaseIterable {
        case appVersion
        case operativeSystem
        case device
        
        var title: String {
            switch self {
            case .appVersion:
                return "app_version_title".localized
            case .operativeSystem:
                return "operating_system_title".localized
            case .device:
                return "device_title".localized
            }
        }
        
        var value: String {
            switch self {
            case .appVersion:
                return AppInfo.getVersion()
            case .operativeSystem:
                return "\(DeviceInfo.isOperatingSystem()) \(DeviceInfo.osVersion())"
            case .device:
                return DeviceInfo.model()
            }
        }

    }
}

