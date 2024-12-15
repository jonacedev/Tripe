//
//  BundleExtension.swift
//  Tripe
//
//  Created by Mei De Blas on 15/12/24.
//

import Foundation

private var bundleKey: UInt8 = 0


extension Bundle {
    private static var onLanguageDispatchOnce: Void = {
        object_setClass(Bundle.main, LanguageBundle.self)
    }()

    class func setLanguage(path: String) {
        _ = self.onLanguageDispatchOnce
        objc_setAssociatedObject(Bundle.main, &bundleKey, path, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

private class LanguageBundle: Bundle, @unchecked Sendable {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundlePath = objc_getAssociatedObject(self, &bundleKey) as? String,
           let bundle = Bundle(path: bundlePath) {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        }
        return super.localizedString(forKey: key, value: value, table: tableName)
    }
}


extension Notification.Name {
    static let didChangeLanguage = Notification.Name("didChangeLanguage")
}
