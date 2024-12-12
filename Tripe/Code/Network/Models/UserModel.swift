//
//  UserModel.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//

import Foundation

struct UserModel: Identifiable, Codable {
    let id: String
    let username: String
    let email: String?
}
