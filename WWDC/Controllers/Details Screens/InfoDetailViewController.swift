//
//  InfoDetailViewController.swift
//  WWDC
//
//  Created by Justin Ehlert on 4/25/15.
//  Copyright (c) 2015 Justin Ehlert. All rights reserved.
//

import UIKit

class InfoDetailViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var titleText: String?
    var descriptionText: String?
    var mainImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
    }
    
    func setData() {
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        mainImageView.image = mainImage
        styleMainImageView()
    }
    
    func styleMainImageView() {
        mainImageView.layer.cornerRadius = mainImageView.frame.size.width/2
        mainImageView.layer.masksToBounds = true;
        mainImageView.layer.borderColor = UIColor.whiteColor().CGColor
        mainImageView.layer.borderWidth = 1
    }

}
