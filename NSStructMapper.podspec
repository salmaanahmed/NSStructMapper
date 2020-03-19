#
# Be sure to run `pod lib lint NSStructMapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSStructMapper'
  s.version          = '1.0'
  s.summary          = 'Library to Map NSObjects to SwiftObjects and Vice Versa'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  NSObject is the base class for most ObjC objects. What if you need to pass your Swift object into some ObjC method.
  What if you are already using NSObjects and trying to migrate to swift, or want to use swif objects for CoreData.
  It is a hassle to write equivelent classes with initializers instead use this library. It will convert your NSObject to SwiftObject and ViceVersa.
                       DESC

  s.homepage         = 'https://github.com/salmaanahmed/NSStructMapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'salmaan.ahmed@hotmail.com' => 'salmaan.ahmed@hotmail.com' }
  s.source           = { :git => 'https://github.com/salmaanahmed/NSStructMapper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/salmaanahmed91'

  s.ios.deployment_target = '10.0'

  s.source_files = 'NSStructMapper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NSStructMapper' => ['NSStructMapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Runtime', '~> 2.1.1'
  s.swift_version = '5.0'
end
