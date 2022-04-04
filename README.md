# baseblocflutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## FlutterGen


### Use for project

```dart
Widget build(BuildContext context) {
  return Assets.images.profile.image();
}
```

### As a part of build_runner

1. Add [build_runner] and [FlutterGen] to your package's pubspec.yaml file:

```
dev_dependencies:
  build_runner:
  flutter_gen_runner:
```

2. Install [FlutterGen]

```sh
$ flutter pub get
```

3. Use [FlutterGen]

```
$ flutter packages pub run build_runner build
```

## Usage

Run `fluttergen` after the configuration [`pubspec.yaml`](https://dart.dev/tools/pub/pubspec).

```sh
$ fluttergen -h

$ fluttergen -c example/pubspec.yaml
```

## Configuration file

[FlutterGen] generates dart files based on the key **`flutter`** and **`flutter_gen`** of [`pubspec.yaml`](https://dart.dev/tools/pub/pubspec).
Default configuration can be found [here](#default-configuration).

```yaml
# pubspec.yaml
# ...

flutter_gen:
  output: lib/gen/ # Optional (default: lib/gen/)
  line_length: 80 # Optional (default: 80)

  # Optional
  integrations:
    flutter_svg: true

  colors:
    inputs:
      - assets/color/colors.xml

flutter:
  uses-material-design: true
  assets:
    - assets/images/

  fonts:
    - family: Raleway
      fonts:
        - asset: assets/fonts/Raleway-Regular.ttf
        - asset: assets/fonts/Raleway-Italic.ttf
          style: italic
