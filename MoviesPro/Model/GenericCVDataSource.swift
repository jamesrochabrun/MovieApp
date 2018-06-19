//
//  GenericDataSource.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/14/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.

import Foundation
import UIKit

/// This class is a simple, immutable, declarative data source Collectionview
final class GenericCVDataSource<V, T: Searchable> : NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
    
    private var models: [T]
    private let configureCell: CellConfiguration
    typealias CellConfiguration = (V, T) -> V
    
    // search
    private var searhResults: [T] = []
    private var isSearchActive : Bool = false
    
    init(models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearchActive ? searhResults.count : models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: V = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let model = getModelAt(indexPath)
        return configureCell(cell, model)
    }
    
    private func getModelAt(_ indexPath: IndexPath) -> T {
        return isSearchActive ? searhResults[indexPath.item] : models[indexPath.item]
    }

    /// MARK: updates for search API - Public
    func update(models: [T]) {
        self.models = models
    }
    
    func search(textToSearch: String) {
        
        isSearchActive = !textToSearch.isEmpty
        searhResults = models.filter {
            let titleToFind = $0.title!.range(of: textToSearch, options: NSString.CompareOptions.caseInsensitive)
            return (titleToFind != nil)
        }
    }
}
























