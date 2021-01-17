//
//  NetwrokingClient.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 16/01/2021.
//

import Foundation
import RxSwift
import Alamofire

class NetworkService: NetworkPotocol {
    func execute<T: Decodable>(_ baseUrl: String, _ offset: Int = 0, _ limit: Int,  _ search: String) -> Observable<T> {
        let encodedUrl = search.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = appendQueryParams(baseUrl, offset, limit, encodedUrl ?? "")

        return Observable.create { observer -> Disposable in

            AF.request(url)
                .validate().responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? networkError.notFound)
                            return
                        }
                        do {
                            let responseData = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(responseData)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                           let reason = networkError(rawValue: statusCode) {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }

    func appendQueryParams(_ baseUrl: String, _ offset: Int, _ limit: Int, _ search: String) -> String {
        let url = baseUrl + "?" + "&" +
                "term=" + search + "&" +
                "mediaType=" + "music" + "&" +
                "offset=" + "\(offset)" + "&" +
                "limit=" + "\(limit)"

        return url
    }

    enum networkError: Int, Error {
        case unAuthorized = 401
        case notFound = 404
        case termNotFound = 500
    }
}
