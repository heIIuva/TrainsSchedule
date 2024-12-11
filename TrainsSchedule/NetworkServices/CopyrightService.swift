//
//  CopyrightService.swift
//  TrainsSchedule
//
//  Created by big stepper on 09/12/2024.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias Copyright = Components.Schemas.CopyrightResponse


protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> Copyright
}

//получение копирайтной информации
final class CopyrightService: CopyrightServiceProtocol {
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init(apikey: apikey))
        return try response.ok.body.json
    }
}
