//
//  SongsServiceTest.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import Foundation
import XCTest
import RxSwift
@testable import GlobalLogic

final class SongsServiceTest: XCTestCase {
    var repository: SongsRepositoryProtocolMock!
    var mock: SongsServiceProtocolMock!
    var disposeBag: DisposeBag!
    var songsData: [SongModel] = []

    override func setUp() {
        super.setUp()
        repository = SongsRepositoryProtocolMock()
        disposeBag = DisposeBag()
        mock = nil
    }

    func testGetHeroesSuccess() {
        whenGetSongs()
        asserGetSongs()
    }

    func testExecuteInvoked() {
        givenMock()
        let response = mock.execute(10, "")
        assertTestGetSongs(response: response)
    }
}

private extension SongsServiceTest {
    func givenMock() {
        mock = SongsServiceProtocolMock()
    }

    func whenGetSongs() {
        repository.getSongs(10, "")
            .subscribe(onNext: { [weak self] response in
                self?.songsData = response.results
        })
        .disposed(by: disposeBag)
    }

    func asserGetSongs() {
        XCTAssertNotNil(songsData)
        XCTAssertEqual(songsData[0].artistName, "artist")
        XCTAssertEqual(songsData[0].collectionName, "collection")
        XCTAssertEqual(songsData[0].trackName, "track")
        XCTAssertEqual(songsData[0].trackViewUrl, "url")
    }

    func assertTestGetSongs(response: Observable<SongsResponseModel>) {
        XCTAssertTrue(mock.invokedExecute)
        XCTAssertEqual(mock.invokedExecuteCount, 1)
        XCTAssertNotNil(response)
    }
}
