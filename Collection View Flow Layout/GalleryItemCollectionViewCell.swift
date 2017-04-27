//
//  GalleryItemCollectionViewCell.swift
//  Collection View Flow Layout
//
//  Created by MrDummy on 4/27/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class GalleryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    // just set the image
    func setGalleryItem(_ item: GalleryItem) {
        itemImageView.image = UIImage(named: item.itemImage)
    }
}
