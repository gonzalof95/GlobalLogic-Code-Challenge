//
//  SongsService.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import Foundation
import RxSwift

class SongsService: SongsServiceProtocol {
    private let repository: SongsRepositoryProtocol

    init(repository: SongsRepositoryProtocol) {
        self.repository = repository
    }

    func execute(_ offset: Int, _ search: String) -> Observable<SongsResponseModel> {
        return repository.getSongs(offset, search)
    }
}
