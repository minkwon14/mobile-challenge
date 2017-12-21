//
//  GalleryViewController.swift
//  500pxGallery
//
//  Created by Minseo Kwon on 2017-12-18.
//  Copyright © 2017 MinKwon. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NetworkManager.sharedInstance.getPhotos(completion: { (photos) in
            self.photos = photos
            self.collectionView.reloadData()
        })
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photos.count
        
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell

        
        let url = photos[indexPath.row].imageURL
//        let image = NetworkManager.sharedInstance.getImage(URL: url)
//        cell.gridImage.image = image

//        let imageURL = URL(fileURLWithPath: url)
//        cell.gridImage.af_setImage(withURL: imageURL)
        
        cell.gridImage.sd_setImage(with: URL(string: url))
        
        return cell
    }

}

