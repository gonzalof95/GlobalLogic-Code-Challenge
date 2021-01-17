//
//  MainPresenterTest.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import XCTest
@testable import GlobalLogic

final class MainPresenterTests: XCTestCase {
    var presenter: MainPresenter!
    var delegate: MainViewControllerMock!
    var service: SongsServiceProtocolMock!

    override func tearDown() {
        super.tearDown()
        service = nil
        presenter = nil
        delegate = nil
    }

    func testExecuteGet() {
        givenMocks()
        whenGetExecuted()
        assertGetExecuted()
    }

    func testMoreDataRequestedNotReloading() {
        givenMocks()
        whenMoreDataRequestedNotReloading()
        assertMoreDataRequestedNotReloading()
    }

    func testMoreDataRequestedReloagind() {
        givenMocks()
        whenMoreDataRequestedReloading()
        assertMoreDataRequestedReloading()
    }
}

private extension MainPresenterTests {
    func givenMocks() {
        service = SongsServiceProtocolMock()
        presenter = MainPresenter(service: service)
        delegate = MainViewControllerMock()
        presenter.delegate = delegate
    }

    func whenGetExecuted() {
        presenter.executeGet(search: "")
    }

    func whenMoreDataRequestedNotReloading() {
        presenter.requestMoreData(false, 1, false, "")
    }

    func whenMoreDataRequestedReloading() {
        presenter.requestMoreData(false, 1, true, "")
    }

    func assertGetExecuted() {
        XCTAssertNotNil(presenter.songsList)
        XCTAssertEqual(presenter.songsList[0].artistName, "artist")
        XCTAssertEqual(presenter.songsList[0].collectionName, "collection")
        XCTAssertEqual(presenter.songsList[0].trackName, "track")
        XCTAssertEqual(presenter.songsList[0].trackViewUrl, "url")
        XCTAssertEqual(presenter.songsList[0].previewUrl, "url")
    }

    func assertMoreDataRequestedNotReloading() {
        XCTAssertNotNil(presenter.songsList)
        XCTAssertNotNil(delegate.invokedShowAnimation)
        XCTAssertEqual(delegate.invokedShowAnimationCount, 1)
    }

    func assertMoreDataRequestedReloading() {
        XCTAssertNotNil(presenter.songsList)
        XCTAssertFalse(delegate.invokedShowAnimation)
    }
}
