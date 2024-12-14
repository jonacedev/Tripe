//
//  BaseViewModel.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import Combine
import UIKit

@Observable
class BaseViewModel {
    
    // MARK: - Properties
    
    var showError: Bool = false
    var errorToShow: BaseError?
    
    func resetError() {
        showError = false
        errorToShow = nil
    }
    
    func presentError(error: BaseError) {
        showError = true
        errorToShow = error
    }
}
