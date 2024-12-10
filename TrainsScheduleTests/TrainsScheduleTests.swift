//
//  TrainsScheduleTests.swift
//  TrainsScheduleTests
//
//  Created by big stepper on 11/12/2024.
//

import XCTest
import OpenAPIURLSession
@testable import TrainsSchedule

final class TrainsScheduleTests: XCTestCase {

    let contentView = ContentView()
    
    // ручка /v3.0/search/
    func testSchedulesBetweenStations() async throws {
        let expectation = expectation(description: "testSchedulesBetween")
        let result: () = await contentView.scheduleBetween(from: "c146", to: "c213")
        XCTAssertNotNil(result)
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/schedule/
    func testStationSchedule() async throws {
        let expectation = expectation(description: "testStationSchedule")
        let result: () = await contentView.stationSchedule(station: "s9613830")
        XCTAssertNotNil(result)
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/thread/
    func testThreadStations() async throws {
        let expectation = expectation(description: "testThreadStations")
        let result: () = await contentView.threadStations(uid: "6296x6294x6292x6291_0_9613602_g24_4")
        
        XCTAssertNotNil(result)
        expectation.fulfill()
        
        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/nearest_stations/
    func testNearestStation() async throws {
        let expectation = expectation(description: "testNearestStations")
        let result: () = await contentView.nearestStations(lat: 55.665390, lng: 37.777104, distance: 50)
        XCTAssertNotNil(result)
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/nearest_settlement/
    func testNearestSettlement() async throws {
        let expectation = expectation(description: "testNearestSettlement")
        let result: () = await contentView.nearestSettlement(lat: 55.665390, lng: 37.777104)
        XCTAssertNotNil(result)
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/carrier/
    func testCarrier() async throws {
        let expectation = expectation(description: "testCarrier")
        let result: () = await contentView.carrier(code: "TK", system: .iata)
        XCTAssertNotNil(result)
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/stations_list/
    func testStationsList() async throws {
        let expectation = expectation(description: "testStationsList")
        let result: () = await contentView.stationsList()
        XCTAssertNotNil(result)
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 10)
    }

    // ручка /v3.0/copyright/
    func testCopyright() async throws {
        let expectation = expectation(description: "testCopyright")
        let result: () = await contentView.copyright()
        XCTAssertNotNil(result)
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 10)
    }
}
