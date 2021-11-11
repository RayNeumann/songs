# Songs

A cross-platform App that queries songs, displays them in a list and allows a detailed view of each fetched song item.
To ensure the list elements in the ui are created on demand, the List is displayed using a
ListView.builder (https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)
Pressing on an item will show a page with song's lyrics in a webview.

## Version

1.0

## Software Toolchain

The following are the key tools utilized:

- Flutter 2.5.3 • channel stable
- Tools • Dart 2.14.4
- Android SDK 29 rev 1

utilized IDE:

- IntelliJ IDEA Community Edition 2021.2.1

Utilized Git Clients:

- Github
- Fork

## Running the Project

If using the terminal, first ensure that all dependencies are installed:

```sh
$ flutter pub get
```

To ensure a clean build, make sure that all previous builds are removed:

```sh
$ flutter clean
```

To build in debug mode, run:

```sh
$ flutter run -t lib/main.dart
```

To build in release mode, run:

```sh
$ flutter run -t lib/main.dart --release
```

for more info on build modes, please see (https://flutter.dev/docs/testing/build-modes)

## State Management

This project uses [Provider](https://pub.dev/packages/provider) as a global state management solution.
