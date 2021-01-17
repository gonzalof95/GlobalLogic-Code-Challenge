//
//  SongsRepositoryProtocol.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import Foundation
import RxSwift

protocol SongsRepositoryProtocol {
    func getSongs(_ offset: Int, _ seach: String) -> Observable<SongsResponseModel>
}
