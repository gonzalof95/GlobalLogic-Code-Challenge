//
//  SongsRepositoryProtocolMock.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import RxSwift
@testable import GlobalLogic

class SongsRepositoryProtocolMock: SongsRepositoryProtocol {
    var invokedGetSongs = false
    var invokedGetSongsCount = 0
    var stubbedGetSongsResult: Observable<SongsResponseModel>!

    func getSongs(_ offset: Int, _ seach: String) -> Observable<SongsResponseModel> {
        invokedGetSongs = true
        invokedGetSongsCount += 1

        let mockService = NetworkServiceMock()
        stubbedGetSongsResult = mockService.execute("base", 0, 10, "")

        return stubbedGetSongsResult
    }
}
