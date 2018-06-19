//
//  PreviewVC.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/17/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PreviewVC: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet private weak var previewImageView: PreviewImageView! {
        didSet {
            previewImageView.movie = movie
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
