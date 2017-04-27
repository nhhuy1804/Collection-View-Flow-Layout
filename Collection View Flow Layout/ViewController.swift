//
//  ViewController.swift
//  Collection View Flow Layout
//
//  Created by MrDummy on 4/27/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // array galleryItems
    var galleryItems: [GalleryItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initGalleryItems()
        collectionView.reloadData()
    }

    // Read gallery items from the items.plist file and create corresponding model items
    fileprivate func initGalleryItems() {
        
        var items = [GalleryItem]()
        let inputFile = Bundle.main.path(forResource: "items", ofType: "plist")
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        
        for inputItem in inputDataArray as! [Dictionary<String, String>] {
            let galleryItem = GalleryItem(dataDictionary: inputItem)
            items.append(galleryItem)
        }
        
        galleryItems = items
    }
    
    // optional method to return number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // return number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryItems.count
    }
    
    // return total number of gallery model items
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryItemCollectionViewCell", for: indexPath) as! GalleryItemCollectionViewCell
        
        cell.setGalleryItem(galleryItems[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let commentView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GalleryItemCommentView", for: indexPath) as! GalleryItemCommentView
        
        commentView.commentLabel.text = "\(kind)"
        
        return commentView
    }
    
    // show an alert when an item is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 4.0
        return CGSize(width: picDimension, height: picDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

