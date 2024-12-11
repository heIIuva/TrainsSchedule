//
//  ListOfStationsService.swift
//  TrainsSchedule
//
//  Created by big stepper on 09/12/2024.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias ThreadStations = Components.Schemas.ThreadResponse


protocol ThreadStationsServiceProtocol {
    func getThreadStations(uid: String) async throws -> ThreadStations
}

//получение списка станций следования нитки
final class ThreadStationsService: ThreadStationsServiceProtocol{
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    
    func getThreadStations(
        uid: String
    ) async throws -> ThreadStations {
        let response = try await client.getThreadStations(query: .init(
            apikey: apikey,
            uid: uid
            )
        )
        return try response.ok.body.json
    }
}
