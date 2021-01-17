//
//  SongsMockModel.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import RxSwift
@testable import GlobalLogic

class SongMockModel {
    func getMock<T: Decodable>() -> Observable<T> {
        return Observable.create { observer -> Disposable in
            let songResponseMock = self.getMockData()
            observer.onNext(songResponseMock as! T)

            return Disposables.create()
        }
    }

    func getMockData() -> SongsResponseModel {
        let songMock = SongModel(artistName: "artist",
                                 collectionName: "collection",
                                 trackName: "track",
                                 trackViewUrl: "url")
        let songResponseMock = SongsResponseModel(resultCount: 1, results: [songMock])

        return songResponseMock
    }
}
