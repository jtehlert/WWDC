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
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    var titleText: String?
    var descriptionText: String?
    var mainImage: UIImage?
    var backgroundColor: UIColor!
    var image1: UIImage?
    var image2: UIImage?
    var image3: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
    }
    
    func setData() {
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        mainImageView.image = mainImage
        
        imageView1.image = image1
        imageView2.image = image2
        imageView3.image = image3
        
        self.view.backgroundColor = self.backgroundColor
        
        styleMainImageView()
        styleImageViews()
    }
    
    func styleMainImageView() {
        mainImageView.layer.cornerRadius = mainImageView.frame.size.width/2
        mainImageView.layer.masksToBounds = true;
        mainImageView.layer.borderColor = UIColor.whiteColor().CGColor
        mainImageView.layer.borderWidth = 1
    }
    
    func styleImageViews() {
        imageView1.layer.cornerRadius = 2
        imageView2.layer.cornerRadius = 2
        imageView3.layer.cornerRadius = 2
        imageView1.layer.masksToBounds = true
        imageView2.layer.masksToBounds = true
        imageView3.layer.masksToBounds = true
    }

}
