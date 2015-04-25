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
    @IBOutlet weak var utdallasButton: UIButton!
    @IBOutlet weak var baseballButton: UIButton!
    @IBOutlet weak var universityeatsButton: UIButton!
    @IBOutlet weak var fridgelyButton: UIButton!
    @IBOutlet weak var hackathonsButton: UIButton!
    @IBOutlet weak var jumpspaceButton: UIButton!
    @IBOutlet weak var bottlerocketButton: UIButton!
    @IBOutlet weak var deltataudeltaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bioButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewBio)), forState: UIControlState.Normal)
        utdallasButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewUTDallas)), forState: UIControlState.Normal)
        baseballButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewBaseball)), forState: UIControlState.Normal)
        universityeatsButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewUniversityEats)), forState: UIControlState.Normal)
        fridgelyButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewFridgely)), forState: UIControlState.Normal)
        hackathonsButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewHackathons)), forState: UIControlState.Normal)
        jumpspaceButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewJumpSpace)), forState: UIControlState.Normal)
        bottlerocketButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewBottleRocket)), forState: UIControlState.Normal)
        deltataudeltaButton.setBackgroundImage(blurImage(DataManager.sharedManager.mainImageForItem(Strings.detailViewDeltaTauDelta)), forState: UIControlState.Normal)
    }
    
    // MARK: Private Methods
    
    func blurImage(image: UIImage) -> UIImage {
        return image.applyDarkEffect()!
    }
    
    // MARK: Actions
    
    @IBAction func bioButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openBio()
    }
    
    @IBAction func utdallasButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openUTDallas()
    }
    
    @IBAction func baseballButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openBaseball()
    }
    
    @IBAction func universityeatsButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openUniversityEats()
    }
    
    @IBAction func fridgelyButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openFridgely()
    }
    
    @IBAction func hackathonsButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openHackathons()
    }
    
    @IBAction func jumpspaceButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openJumpSpace()
    }
    
    @IBAction func bottlerocketButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openBottleRocket()
    }
    
    @IBAction func deltataudeltaButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openDeltaTauDelta()
    }

}
