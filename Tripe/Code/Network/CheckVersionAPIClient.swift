//
//  GlobalPositionAPIClientProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//


protocol CheckVersionAPIClientProtocol {
    func checkVersion() async throws -> String?
}

class CheckVersionAPIClient: CheckVersionAPIClientProtocol {
    
    // MARK: - Public Methods
    
    func checkVersion() async throws -> String? {
        return ""
    }
}
