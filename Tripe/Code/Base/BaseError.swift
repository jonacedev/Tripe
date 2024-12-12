//
//  BaseError.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import Foundation

enum BaseError: Error {
    case generic
    case apiError(ErrorResponse?, Int?)
    
    func description() -> String {
        var description: String = ""
        
        switch self {
        case .generic: description = "error_generic".localized
        case .apiError(let apiError, let statusCode): description = apiError?.description ?? ""
        }
        
        return description
    }
}
