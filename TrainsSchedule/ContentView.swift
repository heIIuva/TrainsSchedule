//
//  ContentView.swift
//  TrainsSchedule
//
//  Created by big stepper on 08/12/2024.
//

import OpenAPIURLSession
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func nearestStations(lat: Double, lng: Double, distance: Int) {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = NearestStationsService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        Task {
            return try await service.getNearestStations(lat: lat, lng: lng, distance: distance)
        }
    }
    
    func threadStations(uid: String) {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = ThreadStationsService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        Task {
            return try await service.getThreadStations(uid: uid)
        }
    }
    
    func scheduleBetween(from: String, to: String) {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = ScheduleBetweenService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        Task {
            return try await service.getScheduleBetweenStations(from: from, to: to)
        }
    }
    
    func stationSchedule(station: String) {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = ScheduleForStationService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        Task {
            return try await service.getScheduleForStation(station: station)
        }
    }
    
    func nearestSettlement(lat: Double, lng: Double) {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = NearestSettlementService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        Task {
            return try await service.getNearestSettlement(lat: lat, lng: lng)
        }
    }
    
    func carrier(code: String, system: System) {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = CarrierService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        Task {
            return try await service.getCarrier(code: code, system: system)
        }
    }
    
    func stationsList() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = StationsService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        Task {
           return try await service.getStationsList()
        }
    }
    
    func copyright() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        
        let service = CopyrightService(
            client: client,
            apikey: Constants.raspApiKey
        )
        
        Task {
            return try await service.getCopyright()
        }
    }
}

#Preview {
    ContentView()
}
