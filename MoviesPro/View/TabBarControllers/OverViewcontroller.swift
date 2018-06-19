//
//  MovieGridController.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class OverViewcontroller: UITableViewController {
    
    // MARK: - Private
    private let client: MovieClient = MovieClient.init()
    private var genericDataSource: GenericTVDataSource<OverviewCell, Movie>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        performRequestWith(client: self.client)
    }
    
    // MARK: - UI Config
    private func configTableView() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView?.registerNib(OverviewCell.self)
    }
    
    // MARK: - Network call
    private func performRequestWith(client: MovieClient) {
        
        client.getFeed(from: .nowPlaying) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movieFeedResult):
                guard let movieResults = movieFeedResult?.results else { return }
                strongSelf.setUpDataSource(with: movieResults)
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    
    // MARK:- set datasource
    private func setUpDataSource(with models: [Movie]) {
        genericDataSource = GenericTVDataSource(models: models) { cell, model in
            let movieVM = MovieViewModel(model)
            cell.configure(viewModel: movieVM)
            return cell
        }
        self.tableView?.dataSource = genericDataSource
        self.tableView?.reloadData()
    }
}

// MARK: - UitableViewDelegate
extension OverViewcontroller {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let dSource = self.genericDataSource else { return }
        let model = dSource.getModelAt(indexPath)
        let storyboard : UIStoryboard = UIStoryboard(name: "DetailStoryBoard", bundle: nil)
        let vc : PreviewVC = storyboard.instantiateViewController(withIdentifier: "PreviewVCID") as! PreviewVC
        vc.movie = model
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
}






