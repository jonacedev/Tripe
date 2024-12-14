//
//  ProfileViewModel.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import Foundation
import FirebaseAuth

@Observable
class ProfileViewModel: BaseViewModel {
    
    var closeSession = false
    
    @MainActor
    func closeSession() async {
        do {
            try Auth.auth().signOut()
            UserSessionManager.shared.userSession = nil
        } catch {
            presentError(error: .apiError(ErrorResponse(messageKey: error.localizedDescription), nil))
        }
    }
}
