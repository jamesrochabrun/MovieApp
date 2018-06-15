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
    
    init(_ model: Movie) {
        self.title = model.title ?? "No title available"
        self.releaseDate = model.releaseDate ?? "No info provided"
    }
}
