//
//  ImageDisplayPerformance.swift
//  MoviesPro
//
//  Created by James Rochabrun on 6/18/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

import UIKit

protocol ImageDisplayPerformance {}

extension ImageDisplayPerformance where Self: UIImageView {
    
    func downSample(image: UIImage, to pointSize: CGSize, scale: CGFloat)  {
        
        //for URL's -> CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)!
        
        let maxDimensionPixels = max(pointSize.width, pointSize.height) * scale
        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxDimensionPixels] as CFDictionary
        
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        if let data = UIImagePNGRepresentation(image),
            
            let imageSource =  CGImageSourceCreateWithData(NSData.init(data: data) as CFData, imageSourceOptions),
            let downsampleImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions) {
            
            self.image = UIImage(cgImage: downsampleImage)
        } else {
            print("ImageDisplayPerformanceError in image data, not able to provide downsample showing normal image now")
            self.image = image
        }
    }
    
    func downSample(urlImage: String, to pointSize: CGSize, scale: CGFloat)  {
        
        let maxDimensionPixels = max(pointSize.width, pointSize.height) * scale
        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxDimensionPixels] as CFDictionary
        
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
       
        if let url = URL(string: urlImage),
            let imageSource =  CGImageSourceCreateWithURL(url as CFURL, imageSourceOptions),
            let downsampleImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions) {
            self.image = UIImage(cgImage: downsampleImage)
        } else {
            print("ImageDisplayPerformanceError in image data, not able to provide downsample showing normal image now")
            self.image = image
        }
    }
}

extension UIImageView: ImageDisplayPerformance {}



