//
//  PhotoParser.swift
//  500pxGallery
//
//  Created by Minseo Kwon on 2017-12-18.
//  Copyright © 2017 MinKwon. All rights reserved.
//

import Foundation

class PhotoParser {
    
    func parsePhotoJSON(jsonDict: [String : Any]) -> [Photo] {
        
        var photosArray = [Photo]()
        
        if let photosDict = jsonDict["photos"] as? [[String : Any]] {
            for photo in photosDict {
                let photoClass = Photo()
                if let name  = photo["name"] as? String {
                    photoClass.name = name
                }
                if let description = photo["description"] as? String {
                    photoClass.description = description
                }
                if let imageURL = photo["image_url"] as? String {
                    photoClass.imageURL = imageURL
                }
                
                photosArray.append(photoClass)
            }
            
        }
        
        return photosArray
    }
}
