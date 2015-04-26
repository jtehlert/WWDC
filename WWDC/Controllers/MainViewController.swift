//
//  MainViewController.swift
//  WWDC
//
//  Created by Justin Ehlert on 4/23/15.
//  Copyright (c) 2015 Justin Ehlert. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ViewManagerDelegate {
    
    var currentChildViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewManager.sharedManager.delegate = self;
        
        if self.currentChildViewController == nil {
            changeChildViewControllerTo(ViewManager.sharedManager.initialViewController())
        }
        
        self.currentChildViewController?.view.frame = self.view.frame
    }
    
    // MARK: Private Methods
    
    private func changeChildViewControllerTo(newChild: UIViewController) {
        self.removeChildViewController()
        self.setChildViewController(newChild)
        self.currentChildViewController = newChild
        self.view.backgroundColor = self.currentChildViewController!.view.backgroundColor
    }
    
    private func removeChildViewController() {
        self.currentChildViewController?.willMoveToParentViewController(nil)
        self.currentChildViewController?.view.removeFromSuperview()
        self.currentChildViewController?.removeFromParentViewController()
    }
    
    private func setChildViewController(newChild: UIViewController) {
        self.addChildViewController(newChild)
        self.view.addSubview(newChild.view)
        newChild.didMoveToParentViewController(self)
    }
    
    // MARK: Public Methods
    
    func setNewChildViewController(newViewController: UIViewController) {
        self.transitionToNewChildViewController(newViewController, options: UIViewAnimationOptions.TransitionNone, duration: 0, animate: false, reverseAnimation: false)
    }
    
    func transitionToNewChildViewController(newViewController: UIViewController, options: UIViewAnimationOptions, duration: NSTimeInterval, animate: Bool, reverseAnimation: Bool) {
        self.transitionToNewChildViewController(newViewController, options: options, duration: duration, animate: animate, completionClosure: nil, reverseAnimation: reverseAnimation)
    }
    
    func transitionToNewChildViewController(newViewController: UIViewController, options: UIViewAnimationOptions, var duration: NSTimeInterval, animate: Bool, completionClosure: (() -> ())?, reverseAnimation: Bool) {
        
        if (duration < 0) {
            duration = 0;
        }
        
        newViewController.view.frame = self.currentChildViewController!.view.frame
        
        self.addChildViewController(newViewController)
        
        if self.currentChildViewController!.isKindOfClass(GridMenuViewController) {
            self.view.backgroundColor = newViewController.view.backgroundColor
        }
        
        if animate {
            
            var parentView: UIView = self.currentChildViewController!.view
            newViewController.view.transform = CGAffineTransformMakeScale(1.1, 1.1)
            if reverseAnimation {
                newViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
            }
            newViewController.view.alpha = 0
            
            parentView.bringSubviewToFront(newViewController.view)
            parentView.bringSubviewToFront(self.currentChildViewController!.view)
            
            self.transitionFromViewController(self.currentChildViewController!, toViewController: newViewController, duration: duration, options: options, animations: { () -> Void in
                
                self.currentChildViewController!.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
                if reverseAnimation {
                    self.currentChildViewController!.view.transform = CGAffineTransformMakeScale(1.1, 1.1)
                }
                self.currentChildViewController!.view.alpha = 0
                newViewController.view.alpha = 1
                newViewController.view.transform = CGAffineTransformIdentity
                
            }, completion: { finished in
                
                self.currentChildViewController!.view.transform = CGAffineTransformIdentity;
                self.changeChildViewControllerTo(newViewController)
                completionClosure?()
                
            })
            
        } else {
            self.changeChildViewControllerTo(newViewController)
            completionClosure?()
        }
        
    }
    
    // MARK: View Manager Delegate
    
    func transitionToViewController(viewController: UIViewController, reverseAnimation: Bool) {
        transitionToNewChildViewController(viewController, options: UIViewAnimationOptions.BeginFromCurrentState, duration: 0.5, animate: true, reverseAnimation: reverseAnimation)
    }

}
