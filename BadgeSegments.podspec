#
# Be sure to run `pod lib lint BadgeSegments.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BadgeSegments'
  s.version          = '0.1.1'
  s.summary          = 'A customizable Segment View with Badges'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A customizable Segment View with Badges writen in swift 5 and easy to use'
  s.swift_version = '5.0'

  s.homepage         = 'https://github.com/mor4eza/BadgeSegments'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { ' ' => 'Morteza.ghrdi@gmail.com' }
  s.source           = { :git => 'https://github.com/Mor4eza/BadgeSegments.git', :tag => s.version.to_s }
#  s.social_media_url = 'https://twitter.com/mor4eza'

  s.ios.deployment_target = '10.0'

  s.source_files = 'BadgeSegments/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BadgeSegments' => ['BadgeSegments/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
