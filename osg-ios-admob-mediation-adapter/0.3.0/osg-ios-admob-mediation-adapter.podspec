Pod::Spec.new do |spec|
  spec.name             = 'osg-ios-admob-mediation-adapter'
  spec.module_name      = 'OSGAdMobMediationAdapter'
  spec.version          = '0.3.0'
  spec.summary          = 'AdMob Mediation adapter for OSG iOS SDK.'
  spec.description      = 'Binary adapter that connects Google AdMob Mediation to OSG as a demand network.'
  spec.homepage         = 'https://github.com/osg-inc/osg-ios-specs'
  spec.license          = { :type => 'Proprietary', :text => 'Copyright OSG. All rights reserved.' }
  spec.authors          = { 'OSG' => 'support@osgdigital.net' }
  spec.source           = {
    :http => 'https://github.com/osg-inc/osg-ios-specs/raw/main/artifacts/osg-ios-admob-mediation-adapter-0.3.0.zip',
    :type => 'zip'
  }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.vendored_frameworks = 'OSGAdMobMediationAdapter.xcframework'
  spec.dependency       'osg-ios-sdk', '~> 1.0'
  spec.dependency       'osg-ios-mediation-common', '~> 0.1'
  spec.dependency       'Google-Mobile-Ads-SDK', '~> 11.0'
  spec.frameworks       = 'UIKit'
end
