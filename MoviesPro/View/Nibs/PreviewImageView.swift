//
//  PreviewImageView.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/18/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PreviewImageView: BaseXibView {
    
    var movie: Movie? {
        didSet {
            imageView.backgroundColor = .red
            guard let mov = movie else { return }
            let vM = MovieViewModel(mov)
            guard let path = vM.backgroundPath else { return }
            let tScale = self.traitCollection.displayScale
            self.layoutIfNeeded()
            let size = self.bounds.size
            print(path)
            imageView.downSample(urlImage: path, to: size, scale: tScale)
        }
    }
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
