//
//  AppInfo.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import UIKit

public class AppInfo {
    
    // MARK: - Public methods
    
    /// Gives you the version of your app using the main Bundle. Typically, its incremented each time you
    /// publish your app to the AppStore. This is the version that is visible on the "Version" section for the AppStore page of the application.
    /// - Returns: A string representing the current version of the app.
    /// - Important: If something goes wrong, it will return an empty String. Maybe we should change this.
    
    public static func getVersion() -> String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return ""
    }
    
    /// Gives you the version number of the main bundle.
    /// - Returns: A string representing the version number of the main bundle.
    /// - Important: If something goes wrong, it will return an empty String. Maybe we should change this.
    
    public static func getBuild() -> String {
        if let version = Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String {
            return version
        }
        return ""
    }
    
    /// Gives you the bundle identifier of the main Bundle. The bundle identifier string identifies your application to the system.
    /// - Returns: A string representing the bundle identifier of the main Bundle.
    /// - Important: If something goes wrong, it will return an empty String. Maybe we should change this.
    
    public static func bundleId() -> String {
        
        if let bundleId = Bundle.main.bundleIdentifier {
            return bundleId
        }
        return ""
    }
}
