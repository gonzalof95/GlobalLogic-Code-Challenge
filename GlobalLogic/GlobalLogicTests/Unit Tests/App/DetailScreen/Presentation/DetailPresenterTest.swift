//
//  DetailPresenterTest.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import XCTest
@testable import GlobalLogic

final class DetailPresenterTest: XCTestCase {
    var presenter: DetailPresenter!
    var delegate: DetailViewControllerMock!

    override func tearDown() {
        super.tearDown()
        presenter = nil
        delegate = nil
    }

    func testViewLoaded() {
        givenMocks()
        whenViewLoaded()
        assertViewLoaded()
    }
}

private extension DetailPresenterTest {
    func givenMocks() {
        let song = SongModel(artistName: "artist",
                             collectionName: "collection",
                             trackName: "track",
                             trackViewUrl: "url",
                             previewUrl: "url")
        presenter = DetailPresenter(song: song)
        delegate = DetailViewControllerMock()
        presenter.delegate = delegate
    }

    func whenViewLoaded() {
        presenter.viewLoaded()
    }

    func assertViewLoaded() {
        XCTAssertTrue(delegate.invokedSetupView)
        XCTAssertEqual(delegate.invokedSetupViewCount, 1)
    }
}
