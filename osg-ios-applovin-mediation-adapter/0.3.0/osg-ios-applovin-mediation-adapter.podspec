Pod::Spec.new do |spec|
  spec.name             = 'osg-ios-applovin-mediation-adapter'
  spec.module_name      = 'OSGAppLovinMediationAdapter'
  spec.version          = '0.3.0'
  spec.summary          = 'AppLovin MAX mediation adapter for OSG iOS SDK.'
  spec.description      = 'Binary adapter that connects AppLovin MAX to OSG as a demand network.'
  spec.homepage         = 'https://github.com/osg-inc/osg-ios-specs'
  spec.license          = { :type => 'Proprietary', :text => 'Copyright OSG. All rights reserved.' }
  spec.authors          = { 'OSG' => 'support@osgdigital.net' }
  spec.source           = {
    :http => 'https://github.com/osg-inc/osg-ios-specs/raw/main/artifacts/osg-ios-applovin-mediation-adapter-0.3.0.zip',
    :type => 'zip'
  }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.vendored_frameworks = 'OSGAppLovinMediationAdapter.xcframework'
  spec.dependency       'osg-ios-sdk', '~> 1.0'
  spec.dependency       'osg-ios-mediation-common', '~> 0.1'
  spec.dependency       'AppLovinSDK', '~> 13.0'
  spec.frameworks       = 'UIKit'
end
