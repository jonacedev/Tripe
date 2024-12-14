//
//  UserSessionManager.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 14/12/24.
//

import Foundation
import FirebaseAuth

final class UserSessionManager {
    
    // MARK: - Singleton
    static let shared = UserSessionManager()
    var userSession: FirebaseAuth.User?
    
    private init() {}
}
