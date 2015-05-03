#
#  Be sure to run `pod spec lint swift-box.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "swift-box"
  s.version      = "0.1.0"
  s.summary      = "A box implementation for Swift"

  s.description  = <<-DESC
                   A [box](http://exploring.liftweb.net/master/index-C.html) implementation for Swift.
                   Helps to handle optional values that can contain errors.
                   DESC

  s.homepage     = "https://github.com/claudetech/swift-box"

  s.license    = { :type => "MIT", :file => "LICENSE" }

  s.author     = { "Claude Tech" => "daniel@claudetech.com" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'


  s.source       = { :git => "https://github.com/claudetech/swift-box.git", :tag => "v0.1.0" }

  s.source_files  = 'box/*.swift'

  s.framework  = "Foundation"
  s.requires_arc = true
end
