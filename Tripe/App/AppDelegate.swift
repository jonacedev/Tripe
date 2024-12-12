//
//  AppDelegate.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//


import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
