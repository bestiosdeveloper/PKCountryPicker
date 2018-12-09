//
//  PKCountryView.swift
//
//  Created by Pramod Kumar on 07/12/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import UIKit

class PKCountryView: UIView {
    //MARK:- IBOutlets
    //MARK:-
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    var view: UIView!
    
    class var instanceFromNib: PKCountryView {
        let myClassNib = UINib(nibName: "PKCountryView", bundle: nil)
        return myClassNib.instantiate(withOwner: nil, options: nil)[0] as! PKCountryView
    }
    
    var countryData: PKCountryModel? {
        didSet {
            self.configureData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureData() {
        
        self.countryNameLabel.font = PKCountryPickerSettings.countryNameFont
        self.countryNameLabel.textColor = PKCountryPickerSettings.countryNameColor
        
        self.countryCodeLabel.font = PKCountryPickerSettings.countryCodeFont
        self.countryCodeLabel.textColor = PKCountryPickerSettings.countryCodeColor
        
        self.countryNameLabel.text = self.countryData?.countryEnglishName
        self.countryCodeLabel.text = self.countryData?.countryCode
        if let imgName = self.countryData?.countryFlag, let img = UIImage(named: "\(imgName)") {
            self.flagImageView.image = img
        }
        else {
            self.flagImageView.image = nil
        }
    }
}
