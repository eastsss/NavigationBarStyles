Pod::Spec.new do |s|
  s.name             = 'NavigationBarStyles'
  s.version          = '0.2.5'
  s.summary          = 'A way to stylize navigation bar.'
  s.homepage         = 'https://github.com/eastsss/NavigationBarStyles'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'eastsss' => 'anatox91@yandex.ru' }
  s.source           = { :git => 'https://github.com/eastsss/NavigationBarStyles.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.default_subspec  = "Core"
  
  s.subspec "Core" do |ss|
    ss.framework  = "UIKit"
    ss.dependency "SwiftyUtilities/UIKit"
    ss.source_files = "NavigationBarStyles/Sources/Core/**/*"
  end

  s.subspec "Reactive" do |ss|
    ss.dependency "NavigationBarStyles/Core"
    ss.dependency 'ReactiveCocoa', '~> 7.2.0'
    ss.source_files = "NavigationBarStyles/Sources/Reactive/**/*"
  end
end
