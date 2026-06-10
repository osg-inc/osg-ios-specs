# osg-ios-specs

OSG iOS SDK 与 Mediation Adapter 的公开 CocoaPods Spec 仓库（二进制分发）。

## Podfile

```ruby
source 'https://github.com/osg-inc/osg-ios-specs.git'
source 'https://cdn.cocoapods.org/'

platform :ios, '12.0'

target 'YourApp' do
  use_frameworks!

  pod 'osg-ios-sdk', '~> 1.0'
  pod 'osg-ios-admob-mediation-adapter', '~> 0.2'
  pod 'Google-Mobile-Ads-SDK'
end
```

AppLovin MAX：

```ruby
  pod 'osg-ios-sdk', '~> 1.0'
  pod 'osg-ios-applovin-mediation-adapter', '~> 0.2'
  pod 'AppLovinSDK'
```

## 目录

```
osg-ios-specs/
├── artifacts/                          # 二进制 zip（podspec :http 下载）
├── osg-ios-sdk/1.0.0/
├── osg-ios-admob-mediation-adapter/0.2.0/
└── osg-ios-applovin-mediation-adapter/0.2.0/
```

## 重新打包 artifacts

在研发仓执行：

```bash
../mopub-ios-sdk/scripts/build-osg-ios-sdk-binary.sh
../osg-ios-admob-mediation-adapter/scripts/build-binary.sh
../osg-ios-applovin-mediation-adapter/scripts/build-binary.sh
```

产物默认输出到本仓库 `artifacts/`。

## AdMob Credentials

| Key | 必填 |
|-----|------|
| `ad_unit_id` | ✅ |
| `app_id` | 建议 |
| `app_key` | 建议 |
| `test_mode` | 否 |

## MAX Credentials

同上；Adapter Class：`OSGAppLovinMediationAdapter`
