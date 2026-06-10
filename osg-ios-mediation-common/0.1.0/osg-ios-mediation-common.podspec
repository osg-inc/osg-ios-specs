Pod::Spec.new do |spec|
  spec.name             = 'osg-ios-mediation-common'
  spec.module_name      = 'OSGMediationCommon'
  spec.version          = '0.1.0'
  spec.summary          = 'Shared mediation helpers for OSG AdMob and AppLovin adapters.'
  spec.description      = 'Binary shared utilities so AdMob and AppLovin OSG adapters can coexist in one app.'
  spec.homepage         = 'https://github.com/osg-inc/osg-ios-specs'
  spec.license          = { :type => 'Proprietary', :text => 'Copyright OSG. All rights reserved.' }
  spec.authors          = { 'OSG' => 'support@osgdigital.net' }
  spec.source           = {
    :http => 'https://github.com/osg-inc/osg-ios-specs/raw/main/artifacts/osg-ios-mediation-common-0.1.0.zip',
    :type => 'zip'
  }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.vendored_frameworks = 'OSGMediationCommon.xcframework'
  spec.dependency       'osg-ios-sdk', '~> 1.0'
  spec.frameworks       = 'UIKit'
end
