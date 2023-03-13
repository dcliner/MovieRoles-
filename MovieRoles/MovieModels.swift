//
//  MovieModels.swift
//  MovieRoles
//
//  Created by Derefaa Cline on 3/8/23.
//

import Foundation
struct MovieDetails: Codable {
    let movies : [D]
    let query: String
    let response: Int
    
    enum CodingKeys: String, CodingKey{
        case movies = "d"
        case query = "q"
        case response = "v"
    }
    
}

// MARK: - D
struct D: Codable {
    let images: I?
    let movieid: String?
    let movietitle: String?
    let actors: String?
    let feature: String?
    let featureid: String?
    let movierank: Int?
    let movieyear: Int?
    let year: String?
    
    enum CodingKeys: String, CodingKey{
        case images = "i"
        case movieid = "id"
        case movietitle = "l"
        case actors = "s"
        case feature = "q"
        case featureid = "qid"
        case movierank = "rank"
        case movieyear = "y"
        case year = "yr"
        
    }
}

// MARK: - I
struct I: Codable {
    let height: Int
    let imageURL: String
    let width: Int

    enum CodingKeys: String, CodingKey {
        case height
        case imageURL = "imageUrl"
        case width
    }
}

