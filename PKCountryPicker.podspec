#
#  Be sure to run `pod spec lint PKCountryPicker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "PKCountryPicker"
  s.version      = "0.0.1"
  s.summary      = "This framework will help you in choosing the country details like flag, county name, country code and much more."

  s.description  = <<-DESC
A Swift based helper class that will provide all the countries in the word with their basic information like flag, county name, country code, ISO code, NSN limits and much more.
                   DESC

  s.homepage     = "https://github.com/bestiosdeveloper/PKCountryPicker"
  s.screenshots  = "https://github.com/bestiosdeveloper/PKCountryPicker/blob/master/PKCountryPickerViewDemo/PKCountryPicker.gif"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Pramod Kumar" => "kumarpramod017@gmail.com" }
  s.social_media_url   = "http://pramodkumar.cf/"

  s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/bestiosdeveloper/PKCountryPicker.git", :tag => "#{s.version.to_s}" }
  s.source_files  = 'PKCountryPickerViewDemo/PKCountryPicker/*'

end
