//
//  PKCountryPicker.swift
//
//  Created by Pramod Kumar on 07/12/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import UIKit

open class PKCountryPicker: UIView {
    
    enum Appearance {
        case dark
        case light
    }
    
    //MARK:- Properties
    //MARK:- Public
    public static let `default` = PKCountryPicker(frame: CGRect.zero)
    var countries: [PKCountryModel] = [PKCountryModel]()
    
    //MARK:- Private
    private let pickerView: UIPickerView = UIPickerView()
    private var selectionHandler: ((PKCountryModel)->Void)?
    private weak var parantVC: UIViewController? = nil
    private var currentSelectedIndex: Int = 0
    
    //MARK:- Picker Life Cycle
    //MARK:-
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Please user default instance. (PKCountryPicker.default.chooseCountry())")
    }
    
    //MARK:- Methods
    //MARK:- Public
    func chooseCountry(onViewController: UIViewController, selectionHandler: @escaping ((PKCountryModel)->Void)) {
        self.initialSetup()
        self.selectionHandler = selectionHandler
        self.parantVC = onViewController
        self.openPicker()
    }
    
    //MARK:- Private
    private func initialSetup() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.frame = CGRect(x: (UIScreen.main.bounds.size.width-PKCountryPickerSettings.pickerSize.width)/2.0, y: UIScreen.main.bounds.size.height, width: PKCountryPickerSettings.pickerSize.width, height: (PKCountryPickerSettings.pickerSize.height + PKCountryPickerSettings.toolbarHeight))
        
        self.pickerView.frame = CGRect(x: 0.0, y: PKCountryPickerSettings.toolbarHeight, width: PKCountryPickerSettings.pickerSize.width, height: PKCountryPickerSettings.pickerSize.height)
        self.addSubview(self.pickerView)
        self.countries = self.getAllCountries()
        
        self.setupToolBar()
        self.setupAppearance()
    }
    
    private func setupToolBar() {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0.0, y: 0.0, width: PKCountryPickerSettings.pickerSize.width, height: PKCountryPickerSettings.toolbarHeight)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(pickerCancelButtonTapped))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(pickerDoneButtonTapped))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action:nil)
        
        if PKCountryPickerSettings.appearance == .dark {
            toolbar.barTintColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)
            cancelButton.tintColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
            doneButton.tintColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        }
        else {
            toolbar.barTintColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
            cancelButton.tintColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)
            doneButton.tintColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)
        }
        
        let array = [cancelButton, spaceButton, doneButton]
        toolbar.setItems(array, animated: true)
        
        self.addSubview(toolbar)
    }
    
    private func setupAppearance() {
        if PKCountryPickerSettings.appearance == .dark {
            self.pickerView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)
            self.pickerView.setValue(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1), forKey: "textColor")
        }
        else {
            self.pickerView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
            self.pickerView.setValue(#colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1), forKey: "textColor")
        }
    }
    
    private func getAllCountries() -> [PKCountryModel] {
        var countries = [PKCountryModel]()
        let frameworkBundle = Bundle(for: PKCountryPicker.self)
        guard let jsonPath = frameworkBundle.path(forResource: "countryData", ofType: "json"), let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
            return countries
        }
        
        do {
            if let jsonObjects = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String:Any]] {
                countries = PKCountryModel.getModels(jsonArr: jsonObjects)
            }
        }
        catch {
            return countries
        }
        return countries
    }
    
    private func openPicker(animated: Bool = true) {
        guard let parent = self.parantVC else {return}
        self.pickerView.reloadAllComponents()
        parent.view.addSubview(self)
        
        let visibleFrame = CGRect(x: (UIScreen.main.bounds.size.width-PKCountryPickerSettings.pickerSize.width)/2.0, y: (UIScreen.main.bounds.size.height-(PKCountryPickerSettings.pickerSize.height+PKCountryPickerSettings.toolbarHeight)), width: PKCountryPickerSettings.pickerSize.width, height: (PKCountryPickerSettings.pickerSize.height + PKCountryPickerSettings.toolbarHeight))
        
        UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: {
            self.frame = visibleFrame
        }) { (isCompleted) in
            
        }
    }
    
    private func closePicker(animated: Bool = true) {
        
        let hiddenFrame = CGRect(x: (UIScreen.main.bounds.size.width-PKCountryPickerSettings.pickerSize.width)/2.0, y: UIScreen.main.bounds.size.height, width: PKCountryPickerSettings.pickerSize.width, height: (PKCountryPickerSettings.pickerSize.height + PKCountryPickerSettings.toolbarHeight))
        
        UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: {
            self.frame = hiddenFrame
        }) { (isCompleted) in
            self.removeFromSuperview()
        }
    }
    
    //MARK:- Action
    @IBAction private func pickerCancelButtonTapped(){
        self.closePicker()
    }
    
    @IBAction private func pickerDoneButtonTapped(){
        
        if let handler = self.selectionHandler {
            handler(self.countries[self.currentSelectedIndex])
            self.closePicker()
        }
    }
}

//MARK:- Picker Delegate and Datasource methods
//MARK:-
extension PKCountryPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.countries.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PKCountryPickerSettings.rowHeight
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let contentView = PKCountryView.instanceFromNib
        contentView.frame = CGRect(x: 0.0, y: 0.0, width: PKCountryPickerSettings.pickerSize.width, height: PKCountryPickerSettings.rowHeight)
        contentView.countryData = self.countries[row]

        return contentView
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentSelectedIndex = row
    }
}
