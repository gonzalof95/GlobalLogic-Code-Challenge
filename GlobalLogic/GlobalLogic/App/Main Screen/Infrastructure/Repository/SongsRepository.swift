//
//  SongsRepository.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import Foundation
import RxSwift

class SongsRepository: SongsRepositoryProtocol {
    private let networkService: NetworkService
    private let url = "https://itunes.apple.com/search"

    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }

    func getSongs(_ offset: Int, _ seach: String) -> Observable<SongsResponseModel> {
        return networkService.execute(url, offset, NetworkingConstants.limit, seach)
    }
}
