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
        animateViews()
    }
    
    func styleMainImageView() {
        mainImageView.layer.cornerRadius = mainImageView.frame.size.width/2
        mainImageView.layer.masksToBounds = true;
        mainImageView.layer.borderColor = UIColor.whiteColor().CGColor
        mainImageView.layer.borderWidth = 1
    }
    
    func styleImageViews() {
        imageView1.layer.cornerRadius = 3
        imageView2.layer.cornerRadius = 3
        imageView3.layer.cornerRadius = 3
        imageView1.layer.masksToBounds = true
        imageView2.layer.masksToBounds = true
        imageView3.layer.masksToBounds = true
    }
    
    func animateViews() {
        
        self.imageView1.alpha = 0
        self.imageView2.alpha = 0
        self.imageView3.alpha = 0
        
        self.imageView1.transform = CGAffineTransformMakeScale(0.1, 0.1)
        self.imageView2.transform = CGAffineTransformMakeScale(0.1, 0.1)
        self.imageView3.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.imageView1.alpha = 1
            self.imageView2.alpha = 1
            self.imageView3.alpha = 1
            
            self.imageView1.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.imageView2.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.imageView3.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }) { finished in
            
        }
    }
    
    

}
