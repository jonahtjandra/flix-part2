//
//  MovieService.swift
//  Flix
//
//  Created by Jonah Tjandra on 2/19/22.
//

import Foundation
import Alamofire
import AlamofireImage

class MovieService {
    //singleton class
    static let shared = MovieService();
    
    func fetchMovies(completion: @escaping (([Movie]) -> Void)) {
        AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
            .validate()
            .responseData { response in
                if let data = response.data {
                    let decoder = JSONDecoder()
                    // create movie list object
                    let movieList = try? decoder.decode(MovieList.self, from: data)
                    if let movies = movieList?.movies {
                        completion(movies)
                    }
                }
            }
    }
}
    
