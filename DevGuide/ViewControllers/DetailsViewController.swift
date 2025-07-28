//
//  DetailsViewController.swift
//  DevGuide
//
//  Created by Yurii Luka on 28.07.2025.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var languageImage: UIImageView!
    @IBOutlet var descriptionTextView: UITextView!
    
    var language: Language!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languageImage.image = UIImage(named: language.imageName)
        descriptionTextView.text = language.description
        
    }
}
