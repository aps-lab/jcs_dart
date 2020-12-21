A library for Dart developers.

Cryptographic operations like hashing and signing depend on that the target data does not change during serialization, transport, or parsing. 
By applying the rules defined by JCS (JSON Canonicalization Scheme), data provided in the JSON [RFC8259] format can be exchanged "as is", while still being subject to secure cryptographic operations.
JCS achieves this by building on the serialization formats for JSON primitives as defined by ECMAScript [ES], constraining JSON data to the I-JSON [RFC7493] subset, and through a platform independent property sorting scheme.

Public RFC: [https://tools.ietf.org/html/rfc8785](https://tools.ietf.org/html/rfc8785)
Main Repository: [https://github.com/cyberphone/json-canonicalization](https://github.com/cyberphone/json-canonicalization)

## Usage

A simple usage example:

```dart
import 'dart:io';

import 'package:jcs_dart/jcs_dart.dart';

void main() {
  var jsonString = File('test/did001.json').readAsStringSync();
  var canonicalized = JsonCanonicalizer().canonicalize(jsonString);

  print('Json Input test/did001.json : \n${jsonString}\n');
  print('Canonicalized : \n${canonicalized}\n');
  print('Result  matches test/did001-canonical.json: \n${canonicalized}\n');
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/aps-lab/jcs_dart/issues
