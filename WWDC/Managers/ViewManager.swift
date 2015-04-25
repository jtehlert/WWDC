//
//  ViewManager.swift
//  WWDC
//
//  Created by Justin Ehlert on 4/23/15.
//  Copyright (c) 2015 Justin Ehlert. All rights reserved.
//

import UIKit

protocol ViewManagerDelegate {
    func transitionToViewController(viewController: UIViewController, reverseAnimation: Bool);
}

class ViewManager: NSObject {
    
    var delegate: ViewManagerDelegate?
    static let sharedManager = ViewManager()
    var currentViewController : UIViewController?
    var previousViewController : UIViewController?
    
    let mainStoryboard: UIStoryboard = UIStoryboard(name: Strings.storyboardMain, bundle: nil)
    
    // Views
    
    var gridMenuViewController: GridMenuViewController?
    var infoScreenUniversityEats: InfoDetailViewController?
    var infoScreenFridgely: InfoDetailViewController?
    var infoScreenJumpSpace: InfoDetailViewController?
    var infoScreenUTDallas: InfoDetailViewController?
    var infoScreenBottleRocket: InfoDetailViewController?
    var infoScreenBio: InfoDetailViewController?
    var infoScreenBaseball: InfoDetailViewController?
    var infoScreenHackathons: InfoDetailViewController?
    var infoScreenDeltaTauDelta: InfoDetailViewController?
    
    func presentViewController(var viewController: UIViewController) {
        if currentViewController == viewController {
            viewController = previousViewController!
            self.delegate?.transitionToViewController(viewController, reverseAnimation: true);
            previousViewController = currentViewController
            currentViewController = viewController
        } else {
            self.delegate?.transitionToViewController(viewController, reverseAnimation: false);
            previousViewController = currentViewController
            currentViewController = viewController
        }
    }
    
    // MARK: View Logic
    
    func openMenu() {
        if gridMenuViewController == nil {
            gridMenuViewController = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenGridMenu) as? GridMenuViewController
        }
        
        presentViewController(gridMenuViewController!)
    }
    
    func openUniversityEats() {
        if infoScreenUniversityEats == nil {
            infoScreenUniversityEats = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenUniversityEats = setScreenInfo(infoScreenUniversityEats!, screenName: Strings.detailViewUniversityEats)
        }
        
        presentViewController(infoScreenUniversityEats!)
    }
    
    func openFridgely() {
        if infoScreenFridgely == nil {
            infoScreenFridgely = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenFridgely = setScreenInfo(infoScreenFridgely!, screenName: Strings.detailViewFridgely)
        }
        
        presentViewController(infoScreenFridgely!)
    }
    
    func openJumpSpace() {
        if infoScreenJumpSpace == nil {
            infoScreenJumpSpace = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenJumpSpace = setScreenInfo(infoScreenJumpSpace!, screenName: Strings.detailViewJumpSpace)
        }
        
        presentViewController(infoScreenJumpSpace!)
    }
    
    func openUTDallas() {
        if infoScreenUTDallas == nil {
            infoScreenUTDallas = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenUTDallas = setScreenInfo(infoScreenUTDallas!, screenName: Strings.detailViewUTDallas)
        }
        
        presentViewController(infoScreenUTDallas!)
    }
    
    func openBottleRocket() {
        if infoScreenBottleRocket == nil {
            infoScreenBottleRocket = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenBottleRocket = setScreenInfo(infoScreenBottleRocket!, screenName: Strings.detailViewBottleRocket)
        }
        
        presentViewController(infoScreenBottleRocket!)
    }
    
    func openBio() {
        if infoScreenBio == nil {
            infoScreenBio = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenBio = setScreenInfo(infoScreenBio!, screenName: Strings.detailViewBio)
        }
        
        presentViewController(infoScreenBio!)
    }
    
    func openBaseball() {
        if infoScreenBaseball == nil {
            infoScreenBaseball = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenBaseball = setScreenInfo(infoScreenBaseball!, screenName: Strings.detailViewBaseball)
        }
        
        presentViewController(infoScreenBaseball!)
    }
    
    func openHackathons() {
        if infoScreenHackathons == nil {
            infoScreenHackathons = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenHackathons = setScreenInfo(infoScreenHackathons!, screenName: Strings.detailViewHackathons)
        }
        
        presentViewController(infoScreenHackathons!)
    }
    
    func openDeltaTauDelta() {
        if infoScreenDeltaTauDelta == nil {
            infoScreenDeltaTauDelta = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenDeltaTauDelta = setScreenInfo(infoScreenDeltaTauDelta!, screenName: Strings.detailViewDeltaTauDelta)
        }
        
        presentViewController(infoScreenDeltaTauDelta!)
    }
    
    func setScreenInfo(viewController: InfoDetailViewController, screenName: String) -> InfoDetailViewController {
        viewController.titleText = DataManager.sharedManager.titleForItem(screenName)
        viewController.descriptionText = DataManager.sharedManager.descriptionForItem(screenName)
        viewController.mainImage = DataManager.sharedManager.mainImageForItem(screenName)
        viewController.image1 = DataManager.sharedManager.image1ForItem(screenName)
        viewController.image2 = DataManager.sharedManager.image2ForItem(screenName)
        viewController.image3 = DataManager.sharedManager.image2ForItem(screenName)
        return viewController
    }
    
    func initialViewController() -> InfoDetailViewController {
        if infoScreenBio == nil {
            infoScreenBio = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
            infoScreenBio = setScreenInfo(infoScreenBio!, screenName: Strings.detailViewBio)
        }
        
        currentViewController = infoScreenBio
        
        return infoScreenBio!
    }
   
}
