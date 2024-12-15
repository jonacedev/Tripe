//
//  TripeApp.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI

@main
struct TripeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) {
            switch scenePhase {
            case .active:
                print("App became active")
            case .inactive:
                print("App is inactive")
            case .background:
                print("App went to the background")
            @unknown default:
                print("Unhandled phase")
            }
        }
    }
}

@Observable
class LanguageSetting {
    // initialise this from UserDefaults if you like
    var locale = Locale(identifier: "en")
}
