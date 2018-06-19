//
//  MovieCell.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell {
    
    // MARK: UI -
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieCoverImageView: UIImageView!
    
    // MARK: - Configuration
    func configure(viewModel: MovieViewModel) {
        
        titleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        guard let url = viewModel.coverPath else { return }
        self.movieCoverImageView.loadImageUsingCacheWithURLString(url, placeHolder: nil) { (_) in
        }
    }
}
