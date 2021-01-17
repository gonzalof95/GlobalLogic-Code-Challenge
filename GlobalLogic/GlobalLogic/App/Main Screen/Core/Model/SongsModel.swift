//
//  SongsModel.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

struct SongsResponseModel: Decodable {
    let resultCount: Int
    let results: [SongModel]
}

struct SongModel: Decodable {
    let artistName: String
    let collectionName: String
    let trackName: String
    let trackViewUrl: String
    let previewUrl: String

    public enum CodingKeys: String, CodingKey {
        case artistName
        case collectionName
        case trackName
        case trackViewUrl = "artworkUrl100"
        case previewUrl
    }
}
