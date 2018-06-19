//
//  MovieViewModel.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

struct MovieViewModel: Searchable {
    
    var title: String?
    let releaseDate: String
    let overview: String
    var coverPath: String?
    var backgroundPath: String?
    
    init(_ model: Movie) {
        self.title = model.title ?? "No title available"
        self.releaseDate = model.releaseDate ?? "No info provided"
        self.overview = model.overview ?? "No Overview"
        let path = "https://image.tmdb.org/t/p/w342"
        if let posterPath = model.poster_path {
            self.coverPath = path + posterPath
        }
        if let coverpath = model.backdrop_path {
            self.backgroundPath = path + coverpath
        }
    }
}
