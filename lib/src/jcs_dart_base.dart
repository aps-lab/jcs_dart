// TODO: Put public facing types in this file.

import 'dart:convert';

class JsonCanonicalizer {
  String canonicalize(String json) {
    var jsonObject = jsonDecode(json);
    var sb = StringBuffer();
    serialize(jsonObject, sb);
    return sb.toString();
  }

  void serialize(Object? o, StringBuffer sb) {
    if (o == null || o is num || o is bool || o is String) {
      // Primitive type
      sb.write(json.encode(o));
    } else if (o is List) {
      // Array - Maintain element order
      sb.write('[');
      var next = false;
      o.forEach((element) {
        if (next) {
          sb.write(',');
        }
        next = true;
        // Array element - Recursive expansion
        serialize(element, sb);
      });
      sb.write(']');
    } else if (o is Map) {
      // Object - Sort properties before serializing
      sb.write('{');
      var next = false;
      var keys = List<String>.from(o.keys);
      keys.sort();
      keys.forEach((element) {
        if (next) {
          sb.write(',');
        }
        next = true;
        // Property names are strings - Use ES6/JSON
        sb.write(json.encode(element));
        sb.write(':');
        // Property value - Recursive expansion
        serialize(o[element], sb);
      });
      sb.write('}');
    }
  }
}
