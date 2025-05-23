# Preview app

Project contains 5 pages of the start (preview) of the application.

You can navigate using arrow buttons or swipes.  
Project includes animation on navigation.  
It uses **Provider** for state management.  
On the last page, the arrow button and the subscribe button do the same: navigate to the app page on the market.  
The application has **adaptive design** for mobile phones.

---

## Environment

- Flutter: 3.29.3
- Dart: 3.7.2
- NDK: 27.0.12077973
- minSdk: flutter.minSdkVersion
- targetSdk: flutter.targetSdkVersion

---

## Used dependencies

- smooth_page_indicator: ^1.2.1
- animations: ^2.0.11
- flutter_custom_clippers: ^2.1.0
- flutter_svg: ^2.1.0
- provider: ^6.1.5
- url_launcher: ^6.3.1
- flutter_launcher_icons: ^0.14.3

---

## Directory Structure
```
lib/
├── assets/
├── pages/
├── providers/
├── widgets/
├── onboarding/
│ ├── navigator.dart
│ ├── view.dart
├── main.dart
```
---

## Directory Description

- `lib/` — Main directory
- `assets/` — Directory with assets for the app
- `widgets/` — Contains functional widgets for screens
- `providers/` — Contains the Provider for the user’s English level button
- `pages/` — Layout and functionality of main slider pages

---

## Files Description

- `main.dart` — Contains theme settings and base app setup with startup logic
- `navigator.dart` — Contains the main screen with the slider and layout view
- `level_provider.dart` — Contains the Provider for the user’s English level button

---

## Widgets

- `levelButton.dart` — Widget with a button to choose the user's English level
- `pageIndicator.dart` — Widget with an indicator for the main slider
- `subButton.dart` — Widget with the button on the last screen (navigates to the app page on the market)
- `view.dart` — File for exporting all widgets from the `widgets/` directory

---
