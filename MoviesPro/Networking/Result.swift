//
//  Result.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
