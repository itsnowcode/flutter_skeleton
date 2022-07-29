# flutter_skeleton
A new Flutter skeleton project.

## Getting Started
This project is a starting point for a Flutter application with Firebase.
Apply [FlutterでDart-defineのみを使って開発環境と本番環境を分ける](https://zenn.dev/riscait/articles/separating-environments-in-flutter) to Skeleton.

### Used fvm for flutter
This project uses [FVM](https://fvm.app/) to manage Flutter versions.
First, please install Flutter by FVM.

```sh
fvm install
```

## VS Code extension
Open the command palette and do the following.
  - `Show Recommended Extensions`
Install the extension found in the workspace recommendations.

### Firebase configuration file
Please copy the following files according to your environment.
- android/src/(dev|stg|prod)/google-services.json
- ios/(dev|stg|prod)/GoogleService-Info.plist

### Firebase setting
Set the following in your Firebase project.
- Enable project 
  - Authentication
  - Firestore Database
- Enable Auth
  - Authentication -> Sign-in-method -> Add new provider -> Anonymous
- Create Firestore data and set rules
  - Firestore Database -> Data
    - create path: /apps/flutter_skeleton/users, document: name=dora chan
  - Firestore Database -> Rules
```
match /apps {
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /apps/flutter_skeleton/users/{id} {
      allow read: if request.auth != null;
    }
  }
}
```

## Run

### Launch the app
```sh
fvm flutter run --dart-define=FLAVOR=dev
```

### Build the app(ios)
```sh
frm flutter build ios --dart-define=FLAVOR=dev
```

## Appendix
- [FlutterでDart-defineのみを使って開発環境と本番環境を分ける](https://zenn.dev/riscait/articles/separating-environments-in-flutter)
- [FVMでFlutter SDKのバージョンをプロジェクト毎に管理する](https://zenn.dev/riscait/articles/flutter-version-management)
- [チームで推奨するVSCode拡張機能を共有するtips](https://future-architect.github.io/articles/20200828/)
