# dart-genderize-api [![pub package](https://img.shields.io/pub/v/genderize.svg)](https://pub.dartlang.org/packages/genderize)
Genderize API wrapper for Dart.
This package will help you to determinate the gender of a person from his name.

## Basic usage
```dart
import 'package:genderize/genderize.dart';

void main() async {
  /// Initializing an instance of [Genderize]
  var gen = Genderize();

  /// Getting a [Gender] of [name] "Manuel".
  var gender = await gen.getGender('Manuel');

  print('You are ${gender.gender}'); //output: "You are male"

  gen.close();
}

```

## How to start
**1.** Initialize an istance of "Genderize" class:
```dart
  var gen = Genderize();
```

**2.** Fetch any data you need from the instance (more informations are specified in the documentation).

**3.** Close the Genderize client to save dart process performances.
 ```dart
  gen.close();
```

## Documentation
https://pub.dev/documentation/genderize/latest/genderize/genderize-library.html

## More info
- API is fetched from https://api.genderize.io
