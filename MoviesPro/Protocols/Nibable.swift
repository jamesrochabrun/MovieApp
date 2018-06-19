//
//  Nibable.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/18/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol Nibable {}

extension Nibable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UIView: Nibable {}

extension UIView {
    
    func instantiateNib<T: UIView>(_ :T.Type, in bundle: Bundle? = nil, owner: Any?, options: [AnyHashable : Any]? = nil) {
        UINib(nibName: T.nibName, bundle: bundle).instantiate(withOwner: owner, options: options)
    }
    
    func instanceFromNib<T: UIView>(_ :T.Type, in bundle: Bundle? = nil, owner: Any? = nil, options: [AnyHashable : Any]? = nil) -> T {
        return UINib(nibName: T.nibName, bundle: bundle).instantiate(withOwner: owner, options: options)[0] as! T
    }
    
    /// to use this method
    /// - the class must be assigned to the View not to the file owner
    /// - The class must be of type UIView
    /// - The outlets must be linked after step 1
    
    static func nib<T: UIView>(_ :T.Type, in bundle: Bundle? = nil, owner: Any? = nil, options: [AnyHashable : Any]? = nil) -> T {
        return UINib(nibName: T.nibName, bundle: bundle).instantiate(withOwner: owner, options: options)[0] as! T
    }
}
