//
//  MainTabBarController.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//
import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK:- App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppereance()
        setNavControllers()
    }
    
    // MARK:- UI functions
    fileprivate func setAppereance() {
        tabBar.tintColor = .purple
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
    // MARK:- Set up Functions
    fileprivate func setNavControllers() {
        
         let sController = MovieSearchController.init(collectionViewLayout: ListFlowLayout())
        let searchNavController = generateNavController(root: sController, title: "Search", image: nil)
        let favNavController = generateNavController(root: MovieGridController(), title: "grid", image: nil)
        
        let dController = DisplayController.init(collectionViewLayout: ListFlowLayout())
        let downloadNavController = generateNavController(root: dController, title: "Display", image: nil)
        viewControllers = [searchNavController, favNavController, downloadNavController]
    }
    
    // MARK:- Helper Functions
    private func generateNavController(root: UIViewController, title: String, image: UIImage?) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: root)
        root.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
