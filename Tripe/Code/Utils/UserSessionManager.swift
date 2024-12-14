//
//  UserSessionManager.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 14/12/24.
//

import Foundation
import Combine
import FirebaseAuth

final class UserSessionManager {
    
    // MARK: - Singleton
    static let shared = UserSessionManager()
    private init() {}
    
    private var sessionSubject = PassthroughSubject<FirebaseAuth.User?, Never>()
    var sessionPublisher: AnyPublisher<FirebaseAuth.User?, Never> {
        sessionSubject.eraseToAnyPublisher()
    }
    
    var userSession: FirebaseAuth.User? {
        didSet {
            DispatchQueue.main.async {
                self.sessionSubject.send(self.userSession)
            }
        }
    }
    
    func checkUserSession() {
        if let user = Auth.auth().currentUser {
            if AppleLoginHelper.shared.isAppleSession() {
                checkAppleSession(for: user)
            } else {
                UserSessionManager.shared.userSession = user
            }
        } else {
            UserSessionManager.shared.userSession = nil
        }
    }
    
    private func checkAppleSession(for user: FirebaseAuth.User) {
        AppleLoginHelper.shared.isValidAppleSession(success: {
            UserSessionManager.shared.userSession = user
        }, failure: {
            UserSessionManager.shared.userSession = nil
        })
    }
    
   
}
