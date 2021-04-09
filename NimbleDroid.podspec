#
# Be sure to run `pod lib lint NimbleDroid.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = 'NimbleDroid'
  s.version = '1.2.1'
  s.summary = 'Functional performance testing using NimbleDroid'
  s.homepage = 'https://github.com/NimbleDroid/NimbleDroid-iOS'
  s.license = 'None'
  s.author = { 'NimbleDroid' => 'contact@nimbledroid.com' }
  s.source = { :git => 'https://github.com/NimbleDroid/NimbleDroid-iOS.git', :tag => s.version.to_s }
  s.documentation_url = 'http://docs.nimbledroid.com/iosUserGuide.html'
  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'
  s.source_files = 'NimbleDroid/*.{h,swift}'
end
