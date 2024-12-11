//
//  Number+Utils.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import Foundation

extension NSNumber {
    
    func toString(from locale: Locale = Locale(identifier: "fr_FR"), minFractionDigits: Int = 2, maxFractionDigits: Int = 12, usesGroupingSeparator: Bool = true) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = locale
        formatter.usesGroupingSeparator = usesGroupingSeparator
        formatter.minimumFractionDigits = minFractionDigits
        formatter.maximumFractionDigits = maxFractionDigits
        formatter.groupingSeparator = "."

        return formatter.string(from: self) ?? ""
    }
}
