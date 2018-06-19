//
//  BaseXibView.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/18/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class BaseXibView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupXib()
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupXib()
        setUpViews()
    }
    
    //MARK: To be override for subclasses
    func setUpViews() {
        
    }
}


extension UIView {
    
    func setupXib() {
        
        let view = self.loadView()
        view.frame = self.bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        self.addSubview(view)
        
    }
    
    func loadView() -> UIView {
        let nibName =  NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
