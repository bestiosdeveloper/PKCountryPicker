//
//  PKCountryPickerSettings.swift
//
//  Created by Pramod Kumar on 08/12/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import UIKit

struct PKCountryPickerSettings {

    /* shouldAddPlusInCountryCode
     * - used to decide to use the "+" sign in front of country code.
     */
    static var shouldAddPlusInCountryCode: Bool = true
    
    /* toolbarHeight
     * - used to give the height of tool bar.
     */
    static var toolbarHeight: CGFloat = 45.0
    
    /* pickerSize
     * - used to give the size for the picker view.
     */
    static var pickerSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: 240.0)
    
    /* rowHeight
     * - used to give the height of the each row in picker view.
     */
    static var rowHeight: CGFloat = 45.0
    
    /* appearance
     * - used to decide the appearance of the picker view.
     */
    static var appearance: PKCountryPicker.Appearance = .light
    
    
    /* countryNameFont
     * - used to set the font of country name text.
     */
    
    static var countryNameFont: UIFont = UIFont.systemFont(ofSize: 15.0)
    
    /* countryNameColor
     * - used to set the color of country name text.
     */
    static var countryNameColor: UIColor = .black
    
    
    /* countryCodeFont
     * - used to set the font of country code text.
     */
    static var countryCodeFont: UIFont = UIFont.systemFont(ofSize: 15.0)
    
    /* countryCodeColor
     * - used to set the color of country code text.
     */
    static var countryCodeColor: UIColor = .black
}
