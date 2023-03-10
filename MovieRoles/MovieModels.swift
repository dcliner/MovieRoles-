//
//  MovieModels.swift
//  MovieRoles
//
//  Created by Derefaa Cline on 3/8/23.
//

import Foundation
struct MovieDetails: Codable {
    let d: [D]
    let q: String
    let v: Int
}

// MARK: - D
struct D: Codable, Identifiable {
    //var movieid = UUID()
    let i: I?
    let id, l, s: String
    let q, qid: String?
    let rank, y: Int?
    let yr: String?
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

