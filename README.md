
# PKCountryPicker

[![CocoaPods](https://img.shields.io/cocoapods/p/FaveButton.svg)]()
[![codebeat badge](https://codebeat.co/badges/580517f8-efc8-4d20-89aa-900531610144)]()

A Swift based helper class that will provide the loader for your application, on a view or on the window.


![preview](https://github.com/kumarpramod017/PKCountryPicker/blob/master/PKLoader.gif)


## Requirements

- iOS 10.0+
- Xcode 9.4

## Installation

For manual instalation, drag Source folder into your project.

or use [CocoaPod](https://cocoapods.org) adding this line to you `Podfile`:

```ruby
pod 'PKCountryPicker'
```

## Usage

#### For Start Loading

1) Just call `chooseCountry()` method with `default` instance of `PKCountryPicker`.

Example:

```swift
PKCountryPicker.default.chooseCountry(onViewController: self) { (selectedCountry) in
print("selected country data: \(selectedCountry)")
}
```

## Configuration To Change Settings 

To change the default configuration of the picker just change the values of  `PKCountryPickerSettings`, Like:

### Important Property:

1) `shouldAddPlusInCountryCode` used to decide to use the "+" sign in front of country code. Default: `true`

2) `toolbarHeight` used to give the height of tool bar. Default: `45.0`

3) `pickerSize` used to give the size for the picker view. Default: `CGSize(width: <same to screen width>, height: 240.0)`

4) `rowHeight` used to give the height of the each row in picker view.  Default: `45.0`

5) `appearance` used to decide the appearance of the picker view.  Default: `PKCountryPicker.Appearance.light`

6) `countryNameFont` used to set the font of country name text.  Default: `UIFont.systemFont(ofSize: 15.0)`

7) `countryNameColor` used to set the color of country name text.  Default: `UIColor.black`

8) `countryCodeFont` used to set the font of country code text.  Default: `UIFont.systemFont(ofSize: 15.0)`

9) `countryCodeColor` used to set the color of country code text.  Default: `UIColor.black`

## Licence

PKCountryPicker is released under the MIT license.
