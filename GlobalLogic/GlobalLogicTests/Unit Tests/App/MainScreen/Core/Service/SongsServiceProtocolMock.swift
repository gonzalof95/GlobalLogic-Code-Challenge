//
//  SongsServiceProtocolMock.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import RxSwift
@testable import GlobalLogic

final class SongsServiceProtocolMock: SongsServiceProtocol {
    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: Observable<SongsResponseModel>!

    func execute(_ offset: Int, _ seach: String) -> Observable<SongsResponseModel> {
        invokedExecute = true
        invokedExecuteCount += 1

        let mock = SongsRepositoryProtocolMock()
        stubbedExecuteResult = mock.getSongs(0, "")

        return stubbedExecuteResult
    }
}
