Pod::Spec.new do |spec|
  spec.name             = 'osg-ios-sdk'
  spec.module_name      = 'OSGSDK'
  spec.version          = '1.0.2'
  spec.summary          = 'OSG iOS SDK for banner, interstitial, rewarded, and native ads.'
  spec.description      = 'Binary distribution of OSG iOS SDK for api.olaexbiz.com v2.'
  spec.homepage         = 'https://github.com/osg-inc/osg-ios-specs'
  spec.license          = { :type => 'Proprietary', :text => 'Copyright OSG. All rights reserved.' }
  spec.authors          = { 'OSG' => 'support@osgdigital.net' }
  spec.source           = {
    :http => 'https://github.com/osg-inc/osg-ios-specs/raw/main/artifacts/osg-ios-sdk-1.0.2.zip',
    :type => 'zip'
  }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.swift_version    = '5.0'
  spec.vendored_frameworks = 'Frameworks/OSGSDK.xcframework', 'Frameworks/OMSDK_Osgdigitalnet.xcframework'
  spec.frameworks       = %w[
    AVFoundation AVKit CoreGraphics CoreLocation CoreMedia CoreTelephony
    Foundation MediaPlayer QuartzCore SystemConfiguration UIKit SafariServices
  ]
  spec.weak_frameworks  = %w[AdSupport StoreKit WebKit]
  spec.xcconfig         = { 'OTHER_LDFLAGS' => '-framework OMSDK_Osgdigitalnet' }
end
