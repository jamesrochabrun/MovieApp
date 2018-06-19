//
//  Movie.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

class Movie: Decodable, Searchable {
    
    var title: String?
    let poster_path: String?
    let overview: String?
    let releaseDate: String?
    let backdrop_path: String?
    let release_date: String?
    
    init(title: String?, poster_path: String, overview: String, releaseDate: String, backdrop_path: String, release_date: String) {
        self.title = title
        self.poster_path = poster_path
        self.overview = overview
        self.releaseDate = releaseDate
        self.backdrop_path = backdrop_path
        self.release_date = release_date
    }
}
