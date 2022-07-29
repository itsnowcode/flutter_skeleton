# flutter_skeleton

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)


## 最初に

### Used fvm for flutter
```sh
fvm install
```

### Firebase configuration file
下記は環境によって正しいファイルを置く。
- android/src/(dev|stg|prod)/google-services.json
- ios/(dev|stg|prod)/GoogleService-Info.plist

## VS Code拡張機能
- コマンドパレットを開き、以下を実行
  - `Show Recommended Extensions`
- ワークスペースの推奨事項にある拡張機能をインストール

## Run

### アプリ起動
flutter run --dart-define=FLAVOR=dev
### アプリビルド
flutter build ios --dart-define=FLAVOR=dev

## Appendix
- [FlutterでDart-defineのみを使って開発環境と本番環境を分ける](https://zenn.dev/riscait/articles/separating-environments-in-flutter)
- [FVMでFlutter SDKのバージョンをプロジェクト毎に管理する](https://zenn.dev/riscait/articles/flutter-version-management)
- [チームで推奨するVSCode拡張機能を共有するtips](https://future-architect.github.io/articles/20200828/)
