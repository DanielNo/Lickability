//
//  PhotoCollectionViewCell.swift
//  Lickability
//
//  Created by Daniel No on 6/27/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(photo : Photo){
        guard let imageURLString = photo.url else{
            return
        }
        print(imageURLString)
        guard let imageURL = URL(string: imageURLString) else{
            return
        }
        let resource = ImageResource(downloadURL: imageURL, cacheKey: imageURLString)
        
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: resource)
        
    }

}
