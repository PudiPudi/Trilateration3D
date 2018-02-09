#
# Be sure to run `pod lib lint Trilateration3D.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Trilateration3D'
  s.version          = '0.1.0'
  s.summary          = 'Perform Trilateration using 3points.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Swift implementation of the Trilateration derivation found on wikipedia.
Finds a Possition from 3 known positions and their distance from the position we are looking for.

This library does not depends on other libraries, it includes the geometric functions needed to solve the trilateration.

Code based on js adaptation of the derivation found on wikipedia.
Github of where code is based off: https://github.com/gheja/trilateration.js
Wikipedia page of Trilateration: https://en.wikipedia.org/wiki/Trilateration
                       DESC

  s.homepage         = 'https://github.com/pudipudi/Trilateration3D'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pudipudi' => 'ludovic.marchand@hotmail.be' }
  s.source           = { :git => 'https://github.com/pudipudi/Trilateration3D.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Trilateration3D/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Trilateration3D' => ['Trilateration3D/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
