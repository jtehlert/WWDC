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
        let itemDict: NSDictionary? = dataDictionary()?.objectForKey(item) as? NSDictionary
        if let title: String = itemDict?.objectForKey(Strings.dataKeyTitle) as? String {
            return title
        } else {
            return "Could not find title"
        }
    }
    
    func descriptionForItem(item: String) -> String {
        let itemDict: NSDictionary? = dataDictionary()?.objectForKey(item) as? NSDictionary
        if let description: String = itemDict?.objectForKey(Strings.dataKeyDescription) as? String {
            return description
        } else {
            return "Could not find description"
        }
    }
    
    func mainImageForItem(item: String) -> UIImage {
        let itemDict: NSDictionary? = dataDictionary()?.objectForKey(item) as? NSDictionary
        let imageName: String = (itemDict?.objectForKey(Strings.dataKeyMainImage) as? String)!
        let image: UIImage? = UIImage(named: imageName as String)
        return image!
    }
    
    func backgroundColorForItem(item: String) -> UIColor {
        let redNum: NSNumber? = colorDictionary(item)?.objectForKey(Strings.dataKeyBackgroundColorRed) as? NSNumber
        let blueNum: NSNumber? = colorDictionary(item)?.objectForKey(Strings.dataKeyBackgroundColorBlue) as? NSNumber
        let greenNum: NSNumber? = colorDictionary(item)?.objectForKey(Strings.dataKeyBackgroundColorGreen) as? NSNumber
        
        if let red = redNum?.floatValue, blue = blueNum?.floatValue, green = greenNum?.floatValue {
            return UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: CGFloat(1))
        }
        
        return UIColor.blackColor()
    }
    
    func image1ForItem(item: String) -> UIImage? {
        if let imageName: String? = imagesDictionary(item)?.objectForKey(Strings.dataKeyImage1) as? String {
            if let image: UIImage? = UIImage(named: imageName!) {
                return image
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func image2ForItem(item: String) -> UIImage? {
        if let imageName: String? = imagesDictionary(item)?.objectForKey(Strings.dataKeyImage2) as? String {
            if let image: UIImage? = UIImage(named: imageName!) {
                return image
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    func image3ForItem(item: String) -> UIImage? {
        if let imageName: String? = imagesDictionary(item)?.objectForKey(Strings.dataKeyImage3) as? String {
            if let image: UIImage? = UIImage(named: imageName!) {
                return image
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    // MARK: Private Methods
    
    func dataFilePath() -> String? {
        return NSBundle.mainBundle().pathForResource("DetailData", ofType: "plist")!
    }
    
    func dataDictionary() -> NSDictionary? {
        return NSDictionary(contentsOfFile: dataFilePath()!)
    }
    
    func imagesDictionary(item: NSString) -> NSDictionary? {
        let dict : NSDictionary? = dataDictionary()?.objectForKey(item) as? NSDictionary
        return dict?.objectForKey(Strings.dataKeyImages) as? NSDictionary
    }
    
    func colorDictionary(item: NSString) -> NSDictionary? {
        let dict : NSDictionary? = dataDictionary()?.objectForKey(item) as? NSDictionary
        return dict?.objectForKey(Strings.dataKeyBackgroundColor) as? NSDictionary
    }
   
}
