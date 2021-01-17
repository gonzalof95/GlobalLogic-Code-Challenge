//
//  NetworkingProtocol.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 16/01/2021.
//

import Foundation
import RxSwift

protocol NetworkPotocol: AnyObject {
    func execute<T: Decodable>(_ baseUrl: String, _ offset: Int, _ limit: Int, _ search: String) -> Observable<T>
    func appendQueryParams(_ baseUrl: String, _ offset: Int, _ limit: Int, _ search: String) -> String
}
