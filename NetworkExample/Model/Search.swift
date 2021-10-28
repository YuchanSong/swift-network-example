//
//  Search.swift
//  SampleApp
//
//  Created by ycsong on 2021/10/25.
//

struct Search: Codable {
    let resultCount: Int?
    let results: [results]?
    
    struct results: Codable {
        let artistId: Int?
        let artistName: String?
        let artistViewUrl: String?
        let artworkUrl100: String?
        let artworkUrl30: String?
        let artworkUrl60: String?
        let collectionExplicitness: String?
        let collectionPrice: Float?
        let country: String?
        let currency: String?
        let kind: String?
        let previewUrl: String?
        let primaryGenreName: String?
        let releaseDate: String?
        let trackCensoredName: String?
        let trackExplicitness: String?
        let trackId: Int?
        let trackName: String?
        let trackPrice: Float?
        let trackTimeMillis: Int?
        let trackViewUrl:String?
        let wrapperType: String?
    }
}
