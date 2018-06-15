//
//  MovieFeedResults.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

class MovieFeedResult: Decodable {
    let results: [Movie]?
    
    init(results: [Movie]?) {
        self.results = results
    }
}
