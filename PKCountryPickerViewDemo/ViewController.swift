//
//  ViewController.swift
//  PKCountryPickerViewDemo
//
//  Created by Pramod Kumar on 07/12/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        self.countryCodeLabel.text = ""
        self.countryNameLabel.text = "Please select"
    }
    @IBAction func openPickerTapped(_ sender: UIButton) {
        PKCountryPicker.default.chooseCountry(onViewController: self) { (selectedCountry) in
            self.countryImageView.image = selectedCountry.flagImage
            self.countryNameLabel.text = selectedCountry.countryEnglishName
            self.countryCodeLabel.text = selectedCountry.countryCode
        }
    }
    
    @IBAction func lightThemeTapped(_ sender: UIButton) {
        PKCountryPickerSettings.appearance = .light
    }
    @IBAction func darkThemeTapped(_ sender: UIButton) {
        PKCountryPickerSettings.appearance = .dark
    }
}

