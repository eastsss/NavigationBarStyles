Pod::Spec.new do |s|
  s.name             = 'NavigationBarStyles'
  s.version          = '0.1.0'
  s.summary          = 'A way to stylize navigation bar.'
  s.homepage         = 'https://github.com/eastsss/NavigationBarStyles'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'eastsss' => 'anatox91@yandex.ru' }
  s.source           = { :git => 'https://github.com/eastsss/NavigationBarStyles.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.framework  = "UIKit"
  s.dependency 'SwiftyUtilities/UIKit'
  s.source_files = 'NavigationBarStyles/Sources/**/*'
end
