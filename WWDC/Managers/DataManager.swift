//
//  DataManager.swift
//  WWDC
//
//  Created by Justin Ehlert on 4/25/15.
//  Copyright (c) 2015 Justin Ehlert. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    static let sharedManager = DataManager()
    
    // MARK: Public Methods
    
    func titleForItem(item: String) -> String {
        let itemDict: NSDictionary? = dataDictionary().objectForKey(item) as? NSDictionary
        if let title: String = itemDict?.objectForKey(Strings.dataKeyTitle) as? String {
            return title
        } else {
            return "Could not find title"
        }
    }
    
    func descriptionForItem(item: String) -> String {
        let itemDict: NSDictionary? = dataDictionary().objectForKey(item) as? NSDictionary
        if let description: String = itemDict?.objectForKey(Strings.dataKeyDescription) as? String {
            return description
        } else {
            return "Could not find description"
        }
    }
    
    func mainImageForItem(item: String) -> UIImage {
        let itemDict: NSDictionary? = dataDictionary().objectForKey(item) as? NSDictionary
        let imageName: String = (itemDict?.objectForKey(Strings.dataKeyMainImage) as? String)!
        let image: UIImage? = UIImage(named: imageName as String)
        return image!
    }
    
    func image1ForItem(item: String) -> UIImage {
        let itemDict: NSDictionary? = dataDictionary().objectForKey(item) as? NSDictionary
        let imagesDict: NSDictionary? = itemDict?.objectForKey(Strings.dataKeyImages) as? NSDictionary
        let imageName: String = (imagesDict?.objectForKey(Strings.dataKeyImage1) as? String)!
        let image: UIImage? = UIImage(named: imageName as String)
        return image!
    }
    
    func image2ForItem(item: String) -> UIImage {
        let itemDict: NSDictionary? = dataDictionary().objectForKey(item) as? NSDictionary
        let imagesDict: NSDictionary? = itemDict?.objectForKey(Strings.dataKeyImages) as? NSDictionary
        let imageName: String = (imagesDict?.objectForKey(Strings.dataKeyImage2) as? String)!
        let image: UIImage? = UIImage(named: imageName as String)
        return image!
    }
    
    func image3ForItem(item: String) -> UIImage {
        let itemDict: NSDictionary? = dataDictionary().objectForKey(item) as? NSDictionary
        let imagesDict: NSDictionary? = itemDict?.objectForKey(Strings.dataKeyImages) as? NSDictionary
        let imageName: String = (imagesDict?.objectForKey(Strings.dataKeyImage3) as? String)!
        let image: UIImage? = UIImage(named: imageName as String)
        return image!
    }
    
    // MARK: Private Methods
    
    func dataFilePath() -> String {
        return NSBundle.mainBundle().pathForResource("DetailData", ofType: "plist")!
    }
    
    func dataDictionary() -> NSDictionary {
        return NSDictionary(contentsOfFile: dataFilePath() as String)!
    }
   
}
