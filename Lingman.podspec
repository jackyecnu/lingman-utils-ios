#
# Be sure to run `pod lib lint Lingman.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Lingman'
  s.version          = '0.1.2'
  s.summary          = 'Lingman Class Library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
 s.swift_versions = ['5.5']
  s.homepage         = 'https://github.com/jackyecnu/lingman-utils-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '钟双金' => 'jackyecnu@126.com' }
  s.source           = { :git => 'https://github.com/jackyecnu/lingman-utils-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Lingman/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Lingman' => ['Lingman/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Swinject'
  s.dependency 'ObjectMapper'
  s.dependency 'RxCocoa'
  s.dependency 'RxSwift'
  s.dependency 'Alamofire'
  s.dependency 'SVProgressHUD'
  s.dependency 'Toast-Swift'
end
