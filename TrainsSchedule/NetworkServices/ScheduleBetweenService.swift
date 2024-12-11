//
//  InterchangeScheduleBetweenStationsService.swift
//  TrainsSchedule
//
//  Created by big stepper on 08/12/2024.
//

import OpenAPIRuntime
import OpenAPIURLSession


typealias ScheduleBetween = Components.Schemas.SchedulesBetweenStationsResponse


protocol ScheduleBetweenServiceProtocol {
    func getScheduleBetweenStations(from: String, to: String) async throws -> ScheduleBetween
}

//получение расписания между станциями
final class ScheduleBetweenService: ScheduleBetweenServiceProtocol {
    
    private let client: Client
    private let apikey: String
  
    init(
        client: Client,
        apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
  
    func getScheduleBetweenStations(
        from: String,
        to: String
    ) async throws -> ScheduleBetween {
        let response = try await client.getSchedulesBetweenStations(query: .init(
            apikey: apikey,
            from: from,
            to: to
            )
        )
        return try response.ok.body.json
    }
}
