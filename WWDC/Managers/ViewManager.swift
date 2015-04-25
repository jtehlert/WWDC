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
    var infoScreenWebsite: InfoDetailViewController?
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
        }
        
        presentViewController(infoScreenUniversityEats!)
    }
    
    func openFridgely() {
        if infoScreenFridgely == nil {
            infoScreenFridgely = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        presentViewController(infoScreenFridgely!)
    }
    
    func openJumpSpace() {
        if infoScreenJumpSpace == nil {
            infoScreenJumpSpace = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        presentViewController(infoScreenJumpSpace!)
    }
    
    func openUTDallas() {
        if infoScreenUTDallas == nil {
            infoScreenUTDallas = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        presentViewController(infoScreenUTDallas!)
    }
    
    func openBottleRocket() {
        if infoScreenBottleRocket == nil {
            infoScreenBottleRocket = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        presentViewController(infoScreenBottleRocket!)
    }
    
    func openBio() {
        if infoScreenBio == nil {
            infoScreenBio = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        presentViewController(infoScreenBio!)
    }
    
    func openBaseball() {
        if infoScreenBaseball == nil {
            infoScreenBaseball = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        presentViewController(infoScreenBaseball!)
    }
    
    func openWebsite() {
        if infoScreenWebsite == nil {
            infoScreenWebsite = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        presentViewController(infoScreenWebsite!)
    }
    
    func openDeltaTauDelta() {
        if infoScreenDeltaTauDelta == nil {
            infoScreenDeltaTauDelta = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        presentViewController(infoScreenDeltaTauDelta!)
    }
    
    func initialViewController() -> InfoDetailViewController {
        if infoScreenBio == nil {
            infoScreenBio = self.mainStoryboard.instantiateViewControllerWithIdentifier(Strings.storyboardScreenInfoDetail) as? InfoDetailViewController
        }
        
        currentViewController = infoScreenBio
        
        return infoScreenBio!
    }
   
}
