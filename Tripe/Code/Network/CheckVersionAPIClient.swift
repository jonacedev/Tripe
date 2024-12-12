//
//  GlobalPositionAPIClientProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//

import SwiftUI
import Firebase

protocol CheckVersionAPIClientProtocol {
    func checkVersion(success: @escaping () -> Void, failure: @escaping () -> Void)
}

class CheckVersionAPIClient: CheckVersionAPIClientProtocol {
    
    // MARK: - Check Version
    
    func checkVersion(success: @escaping () -> Void, failure: @escaping () -> Void) {
        Firestore.firestore().collection("version").document("currentVersion").getDocument() { (document, error) in
            if let document = document, document.exists {
                do {
                    let data = try document.data(as: CheckVersionModel.self)
                    let appVersion = Double(AppInfo.getVersion()) ?? 0.0
                    if appVersion >= data.version {
                        success()
                    } else {
                        failure()
                    }
                } catch {
                    failure()
                }
            } else {
                print("Document does not exist: \(error?.localizedDescription ?? "")")
                failure()
            }
        }
    }
}
