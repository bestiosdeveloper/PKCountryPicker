//
//  PKCountryModel.swift
//
//  Created by Pramod Kumar on 07/12/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import UIKit

public struct PKCountryModel {
    var countryID: Int = 0
    var countryEnglishName: String = ""
    var countryLocalName: String = ""
    var countryFlag: String = ""
    var ISOCode: String = ""
    var countryCode: String = ""
    var countryExitCode: Int = 0
    var minNSN: Int = 0
    var maxNSN: Int = 0
    var trunkCode: Int = 0
    var googleStore: Int = 0
    var appleStore: Int = 0
    var uNRank: Int = 0
    var mobileRank: Int = 0
    var sortIndex: Int = 0
    var flagImage: UIImage? {
        return UIImage(named: self.countryFlag)
    }
    
    init(json: [String: Any]) {
        if let obj = json["CountryID"] as? Int {
            self.countryID = obj
        }
        
        if let obj = json["CountryEnglishName"] as? String {
            self.countryEnglishName = obj
        }
        
        if let obj = json["CountryLocalName"] as? String {
            self.countryLocalName = obj
        }
        
        if let obj = json["CountryFlag"] as? String {
            self.countryFlag = obj
        }
        
        if let obj = json["ISOCode"] as? String {
            self.ISOCode = obj
            self.countryFlag = "\(obj).png".lowercased()
        }
        
        if let obj = json["CountryCode"] {
            self.countryCode = PKCountryPickerSettings.shouldAddPlusInCountryCode ? "+\(obj)" : "\(obj)"
        }
        
        if let obj = json["CountryExitCode"] as? Int {
            self.countryExitCode = obj
        }
        
        if let obj = json["Min NSN"] as? Int {
            self.minNSN = obj
        }
        
        if let obj = json["Max NSN"] as? Int {
            self.maxNSN = obj
        }
        
        if let obj = json["TrunkCode"] as? Int {
            self.trunkCode = obj
        }
        
        if let obj = json["GoogleStore"] as? Int {
            self.googleStore = obj
        }
        
        if let obj = json["AppleStore"] as? Int {
            self.appleStore = obj
        }
        
        if let obj = json["UNRank"] as? Int {
            self.uNRank = obj
        }
        
        if let obj = json["MobileRank"] as? Int {
            self.mobileRank = obj
        }
        
        if let obj = json["SortIndex"] as? Int {
            self.sortIndex = obj
        }
    }
    
    static func getModels(jsonArr: [[String:Any]]) -> [PKCountryModel] {
        return jsonArr.map { (json) -> PKCountryModel in
            PKCountryModel(json: json)
        }
    }
}
