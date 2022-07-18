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

## 未設定箇所

- https://zenn.dev/riscait/articles/separating-environments-in-flutter#xcode%E3%81%AEbuild-pre-actions-%E3%81%AB%E4%BD%9C%E6%88%90%E3%81%97%E3%81%9F%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%82%92%E7%99%BB%E9%8C%B2%E3%81%99%E3%82%8B
- https://zenn.dev/riscait/articles/separating-environments-in-flutter#googleservice-info.plist%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B

## 最初に
下記は環境によって正しいファイルを置く。
- GoogleService-Info.plist
- google-services.json

## Run

### アプリ起動
flutter run --dart-define=FLAVOR=dev
### アプリビルド
flutter build ios --dart-define=FLAVOR=dev

