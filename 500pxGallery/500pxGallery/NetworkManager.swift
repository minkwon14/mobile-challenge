//
//  NetworkManager.swift
//  500pxGallery
//
//  Created by Minseo Kwon on 2017-12-18.
//  Copyright © 2017 MinKwon. All rights reserved.
//

import Alamofire
import AlamofireImage

class NetworkManager {

    static let sharedInstance = NetworkManager()
    let baseURL = "https://api.500px.com/v1/"
    let consumerKey = "&consumer_key=h7m29g7FzppXBTVRkdehIUEk4LhAqFJwERwjwmoa"
    
    func getPhotos(completion: @escaping ([Photo]) -> ()) {
        var photos = [Photo]()
        let photoURL = URL(string:baseURL + "photos?feature=popular" + consumerKey)
        
        Alamofire.request(photoURL!).responseJSON( completionHandler: { response in
            if let jsonParser = response.result.value as? [String : Any] {
                let parsedPhoto = PhotoParser()
                photos = parsedPhoto.parsePhotoJSON(jsonDict: jsonParser)
            }
                completion(photos)
            }
        )
    }
    
    func getImage(URL: String) -> UIImage {
        
        var downloadedImage = UIImage()
        
        Alamofire.request(URL+".jpg").responseImage { response in
            if let image = response.result.value {
                print ("image downloaded: \(image)")
                downloadedImage = image
            }
        }
        
        return downloadedImage
    }
    
    
}
