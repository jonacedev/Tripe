//
//  GlobalPositionDataManagerProtocol.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 10/12/24.
//


protocol CheckVersionDataManagerProtocol {
    func checkVersion(success: @escaping () -> Void, failure: @escaping () -> Void)
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
    func checkVersion(success: @escaping () -> Void, failure: @escaping () -> Void) {
        apiClient.checkVersion(success: success, failure: failure)
    }
}
