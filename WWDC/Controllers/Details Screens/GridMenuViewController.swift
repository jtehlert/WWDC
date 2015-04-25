//
//  GridMenuViewController.swift
//  WWDC
//
//  Created by Justin Ehlert on 4/25/15.
//  Copyright (c) 2015 Justin Ehlert. All rights reserved.
//

import UIKit

class GridMenuViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var bioButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bioButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewBio)), forState: UIControlState.Normal)
    }
    
    // MARK: Private Methods
    
    func blurImage(image: UIImage) -> UIImage {
        return image.applyDarkEffect()!
    }
    
    // MARK: Actions
    
    @IBAction func bioButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openMenu()
    }

}
