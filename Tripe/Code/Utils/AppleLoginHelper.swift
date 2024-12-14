//
//  AppleHelper.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 14/12/24.
//

import Foundation
import CryptoKit
import FirebaseAuth
import AuthenticationServices

class AppleLoginHelper {
    static let shared = AppleLoginHelper()
    let providerData = Auth.auth().currentUser?.providerData
    
    private init() { }
    
    // MARK: - CHECKS
    
    func isValidAppleSession(success: @escaping () -> Void, failure: @escaping () -> Void) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        if let appleProviderData = providerData?.first(where: { $0.providerID == "apple.com" }) {
            Task {
                let credentialState = try await appleIDProvider.credentialState(forUserID: appleProviderData.uid)
                switch credentialState {
                case .authorized:
                    success()
                default:
                    failure()
                }
            }
        }
    }
    
    func isAppleSession() -> Bool {
        providerData?.contains { $0.providerID == "apple.com" } ?? false
    }
    
    // MARK: - HELPERS
    
    func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}
