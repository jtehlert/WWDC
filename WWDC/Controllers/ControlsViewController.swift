//
//  ControlsViewController.swift
//  WWDC
//
//  Created by Justin Ehlert on 4/24/15.
//  Copyright (c) 2015 Justin Ehlert. All rights reserved.
//

import UIKit

class ControlsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func gridButtonPressed(sender: AnyObject) {
        ViewManager.sharedManager.openMenu()
    }
}
