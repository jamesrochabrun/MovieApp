//
//  OverviewCell.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/17/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class OverviewCell: UITableViewCell {
    
    @IBOutlet weak var coverView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    // MARK: - Configuration
    func configure(viewModel: MovieViewModel) {
        
        overviewLabel.text = viewModel.overview
        guard let url = viewModel.coverPath else { return }
        self.coverView.loadImageUsingCacheWithURLString(url, placeHolder: nil) { (_) in
        }
    }
}

