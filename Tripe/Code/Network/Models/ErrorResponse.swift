//
//  ErrorResponse.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 11/12/24.
//

import Foundation

struct ErrorResponse: Codable {

    /** Error message key. */
    var messageKey: String
    /** Error code. */
    var description: String?

    init(messageKey: String, errorCode: String? = nil) {
        self.messageKey = messageKey
        self.description = errorCode
    }
}
