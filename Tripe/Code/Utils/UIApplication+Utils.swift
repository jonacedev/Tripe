//
//  UIApplication+Utils.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import UIKit

extension UIApplication {
    func openAppStore() {
        let appStoreURL = "https://apps.apple.com/app/id6538716876"
        if let url = URL(string: appStoreURL) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
       }
    }
}
