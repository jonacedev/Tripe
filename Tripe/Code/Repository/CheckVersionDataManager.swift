//
//  GlobalPositionDataManagerProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//


protocol CheckVersionDataManagerProtocol {
    func checkVersion() async throws -> String?
}

class CheckVersionDataManager {
    
    // MARK: - Properties
    
    private var apiClient: CheckVersionAPIClientProtocol
    
    // MARK: - Object lifecycle
    
    init(apiClient: CheckVersionAPIClientProtocol) {
        self.apiClient = apiClient
    }
}

extension CheckVersionDataManager: CheckVersionDataManagerProtocol {
    func checkVersion() async throws -> String? {
        try await apiClient.checkVersion()
    }
}
