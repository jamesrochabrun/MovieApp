//
//  MovieSearchController.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieSearchController: UICollectionViewController {
    
    // MARK:- UI
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Private
    private let client: MovieClient = MovieClient.init()
    private var genericDataSource: GenericCVDataSource<MovieCell, MovieViewModel>?
    
    // MARK: - App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performRequestWith(client: self.client)
        configCollectionView()
        setUpSearchBar()
    }
    
    // MARK: - UI Config
    private func configCollectionView() {
        self.collectionView?.registerNib(MovieCell.self)
    }
    
    private func setUpSearchBar() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    // MARK: - Network call
    private func performRequestWith(client: MovieClient) {
        
        client.getFeed(from: .nowPlaying) { result in
            switch result {
            case .success(let movieFeedResult):
                guard let movieResults = movieFeedResult?.results else { return }
                // this is handled on Main thread
                self.setUpDataSource(with: movieResults)
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    
    // MARK:- set datasource
    private func setUpDataSource(with models: [Movie]) {
        genericDataSource = GenericCVDataSource(models: models.compactMap { MovieViewModel( $0) }) { cell, model in
            cell.configure(viewModel: model)
            return cell
        }
        self.collectionView?.dataSource = genericDataSource
    }
}

extension MovieSearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        genericDataSource?.search(textToSearch: searchText)
        collectionView?.reloadData()
    }
}










