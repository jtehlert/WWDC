//
//  RootViewController.swift
//  WWDC
//
//  Created by Justin Ehlert on 4/24/15.
//  Copyright (c) 2015 Justin Ehlert. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var controlsView: UIView!
    
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let mainViewController: MainViewController = MainViewController()
    var controlsViewController: ControlsViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        controlsViewController = self.mainStoryboard.instantiateViewControllerWithIdentifier("controls") as? ControlsViewController

        self.mainViewController.view.frame = self.mainView.frame
        self.mainView.addSubview(mainViewController.view)
        self.controlsViewController!.view.frame = self.controlsView.frame
        self.controlsView.addSubview(self.controlsViewController!.view)
    }

}
