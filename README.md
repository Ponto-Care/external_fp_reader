# External FP Reader

External fp reader is a plugin to use U are U 4500 Fingerprint Reader on Flutter apps.

## Installation

At `pubspec.yaml` add:

```yaml
external_fp_reader:
    git:
      url: git@github.com:Ponto-Care/external_fp_reader.git
      ref: master
```

And on `android/app/src/main/AndroidManifest.xml` file add:

```xml
xmlns:tools="http://schemas.android.com/tools"
```
At the end of the line `<manifest...`

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:external_fp_reader/external_fp_reader.dart';

class ScreenScreen extends StatefulWidget {
  final ExternalFpReader externalFpReader;

  const ScreenScreen({Key key, this.externalFpReader}) : super(key: key);

  @override
  _ScreenScreenState createState() => _ScreenScreenState();
}

class _ScreenScreenState extends State<ScreenScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlineButton(
        onPressed: () {
          ExternalFpReader.scan();
        },
      ),
    );
  }
}

```

## License
[MIT](https://choosealicense.com/licenses/mit/)