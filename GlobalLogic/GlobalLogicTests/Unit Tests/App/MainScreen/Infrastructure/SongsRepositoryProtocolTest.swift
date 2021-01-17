//
//  SongsRepositoryProtocolTest.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import XCTest
import RxSwift
@testable import GlobalLogic

final class SongsRepositoryProtocolTests: XCTestCase {
    var mock: SongsRepositoryProtocolMock!

    override func tearDown() {
        super.tearDown()
        mock = nil
    }

    func testGetHeroesInvoked() {
        givenMock()
        let response = mock.getSongs(10, "")
        assertGetSongsInvoked(response)
    }
}

private extension SongsRepositoryProtocolTests {
    func givenMock() {
        mock = SongsRepositoryProtocolMock()
    }

    func assertGetSongsInvoked(_ response: Observable<SongsResponseModel>) {
        XCTAssertTrue(mock.invokedGetSongs)
        XCTAssertEqual(mock.invokedGetSongsCount, 1)
        XCTAssertNotNil(response)
    }
}
