//
//  NetworkServiceMock.swift
//  GlobalLogicTests
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import Foundation
import RxSwift
@testable import GlobalLogic

final class NetworkServiceMock: NetworkPotocol {
    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (baseUrl: String, offset: Int, limit: Int, search: String)?

    func execute<T: Decodable>(_ baseUrl: String, _ offset: Int, _ limit: Int, _ search: String) -> Observable<T> {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (baseUrl, offset, limit, search)

        return Observable.create { observer -> Disposable in

            let mock = SongMockModel()
            let mockResponse = mock.getMockData()
            observer.onNext(mockResponse as! T)

            return Disposables.create()
        }
    }

    var invokedAppendQueryParams = false
    var invokedAppendQueryParamsCount = 0
    var invokedAppendQueryParamsParameters: (baseUrl: String, offset: Int, limit: Int, search: String)?
    var stubbedAppendQueryParamsResult: String! = ""

    func appendQueryParams(_ baseUrl: String, _ offset: Int, _ limit: Int, _ search: String) -> String {
        invokedAppendQueryParams = true
        invokedAppendQueryParamsCount += 1
        invokedAppendQueryParamsParameters = (baseUrl, offset, limit, search)
        return stubbedAppendQueryParamsResult
    }
}
