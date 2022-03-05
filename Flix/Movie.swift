//
//  Movie.swift
//  Flix
//
//  Created by Jonah Tjandra on 2/19/22.
//

import Foundation

struct MovieList: Codable {
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    var movies: [Movie]
}

struct Movie: Codable{
    
    enum CodingKeys: String, CodingKey {
        case Title = "title"
        case Description = "overview"
        case PosterImageUrl = "poster_path"
        case BackdropImageUrl = "backdrop_path"
        case Date = "release_date"
    }
    
    var Title: String
    var Description: String
    var PosterImageUrl: String
    var BackdropImageUrl: String
    var Date: String
}
