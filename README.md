# osg-ios-specs

OSG iOS SDK 与 Mediation Adapter 的 **二进制 Podspec 与 artifacts 仓库**（发版源）。  
第三方接入请优先使用 **CocoaPods 官方源（Trunk）**，无需添加本仓库为 `source`。

| Pod | 最新版本 | CocoaPods |
| --- | --- | --- |
| `osg-ios-sdk` | 1.0.1 | https://cocoapods.org/pods/osg-ios-sdk |
| `osg-ios-mediation-common` | 0.1.0 | ✅ Trunk（adapter 依赖，自动安装） |
| `osg-ios-admob-mediation-adapter` | 0.3.1 | ⏳ 待推 Trunk |
| `osg-ios-applovin-mediation-adapter` | 0.3.1 | ⏳ 待推 Trunk |

---

## 第三方接入（推荐：仅官方 CDN）

```ruby
source 'https://cdn.cocoapods.org/'

platform :ios, '12.0'

target 'YourApp' do
  use_frameworks! :linkage => :static

  pod 'osg-ios-sdk', '~> 1.0'
end
```

```bash
pod install --repo-update
```

使用 **`.xcworkspace`** 打开工程。

### SDK 初始化（Swift）

```swift
import OSGSDK

let config = OSGConfiguration(adUnitIdForAppInitialization: "你的广告位ID")
config.appId = "平台 appid"       // 建议
config.appKey = "平台 app_key"    // 建议
config.testMode = false           // 测试环境可 true

OSG.sharedInstance().initializeSdk(with: config) {
    // 初始化完成后再加载广告
}
```

### 仅主 SDK

上表 Podfile 即可（Banner / Native / Interstitial / Rewarded）。

### AdMob Mediation

```ruby
  pod 'osg-ios-sdk', '~> 1.0'
  pod 'osg-ios-admob-mediation-adapter', '~> 0.3'
  pod 'Google-Mobile-Ads-SDK'
```

### AppLovin MAX

```ruby
  pod 'osg-ios-sdk', '~> 1.0'
  pod 'osg-ios-applovin-mediation-adapter', '~> 0.3'
  pod 'AppLovinSDK'
```

### 同时接入两个 adapter

`osg-ios-mediation-common` 会由 adapter **自动依赖**，无需手写。

```ruby
  pod 'osg-ios-sdk', '~> 1.0'
  pod 'osg-ios-admob-mediation-adapter', '~> 0.3'
  pod 'osg-ios-applovin-mediation-adapter', '~> 0.3'
  pod 'Google-Mobile-Ads-SDK'
  pod 'AppLovinSDK'
```

---

## 备选：GitHub Spec 源（内部 / 未上 Trunk 的版本）

若需使用尚未推送 Trunk 的版本，可显式添加本仓库：

```ruby
source 'https://github.com/osg-inc/osg-ios-specs.git'
source 'https://cdn.cocoapods.org/'
```

---

## Mediation 后台凭证

| Key | 必填 | 说明 |
| --- | --- | --- |
| `ad_unit_id` | ✅ | OSG 广告位 ID |
| `app_id` | 建议 | OSG `appid` |
| `app_key` | 建议 | OSG `app_key` |
| `test_mode` | 否 | `true` / `false` |

AppLovin Adapter Class：`OSGAppLovinMediationAdapter`

---

## 目录（研发 / 发版）

```
osg-ios-specs/
├── artifacts/                              # 二进制 zip
├── osg-ios-sdk/1.0.1/
├── osg-ios-mediation-common/0.1.0/
├── osg-ios-admob-mediation-adapter/0.3.1/
└── osg-ios-applovin-mediation-adapter/0.3.1/
```

## 重新打包 artifacts

```bash
../osg-ios-specs/scripts/build-all.sh
```

或分步执行 `mopub-ios-sdk`、`osg-ios-mediation-common`、两 adapter 仓库下的 `scripts/build-binary.sh`。

## 发布到 CocoaPods Trunk

新版本发版后，在对应 podspec 目录执行：

```bash
pod trunk push <name>.podspec --allow-warnings
```

推送顺序（有依赖，须按序执行）：

```bash
# 1. 主 SDK（已完成 1.0.1）
cd osg-ios-sdk/1.0.1
pod trunk push osg-ios-sdk.podspec --allow-warnings --skip-import-validation

# 2. 等待 CDN 可解析 osg-ios-sdk（约 5–10 分钟），可用下面命令确认：
pod spec cat osg-ios-sdk

# 3. 共享库（已完成 0.1.0，可跳过）
# cd osg-ios-mediation-common/0.1.0
# pod trunk push osg-ios-mediation-common.podspec --allow-warnings --skip-import-validation

# 4. 两个 adapter（待执行）
cd osg-ios-admob-mediation-adapter/0.3.1
pod trunk push osg-ios-admob-mediation-adapter.podspec --allow-warnings --skip-import-validation

cd osg-ios-applovin-mediation-adapter/0.3.1
pod trunk push osg-ios-applovin-mediation-adapter.podspec --allow-warnings --skip-import-validation
```

若刚推完 `osg-ios-sdk` 即推 adapter 报找不到依赖，可加 `--synchronous` 或等待 CDN 同步后重试。
