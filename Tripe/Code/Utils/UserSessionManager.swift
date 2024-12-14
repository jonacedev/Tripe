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
    
    private var sessionSubject = PassthroughSubject<FirebaseAuth.User?, Never>()
    var sessionPublisher: AnyPublisher<FirebaseAuth.User?, Never> {
        return sessionSubject.eraseToAnyPublisher()
    }
    
    var userSession: FirebaseAuth.User? {
        didSet {
            sessionSubject.send(userSession)
        }
    }
    
    private init() {}
}
