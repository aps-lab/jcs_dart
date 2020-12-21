import 'dart:convert';
import 'dart:io';
import 'dart:core';

import 'package:jcs_dart/jcs_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Parsing json types', () {
    test('Parse and test type of a null object', () {
      var jsonObject = json.decode('null');
      expect(identical(null, jsonObject), true);
      expect(null, jsonObject);
      expect(jsonObject is Null, true);
      expect(jsonObject.runtimeType, Null);
    });

    test('Parse and test type of an int object', () {
      var jsonObject = json.decode('2');
      expect(2, jsonObject);
      expect(identical(2, jsonObject), true);
      expect(jsonObject is double, false);
      expect(jsonObject is int, true);
      expect(jsonObject is num, true);
      expect(jsonObject.runtimeType, int);
    });

    test('Parse and test type of a double object', () {
      var jsonObject = json.decode('2.2');
      expect(2.2, jsonObject);
      expect(identical(2.2, jsonObject), true);
      expect(jsonObject is int, false);
      expect(jsonObject is double, true);
      expect(jsonObject is num, true);
      expect(jsonObject.runtimeType, double);
    });

    test('Parse and test type of a boolean false object', () {
      var jsonObject = json.decode('false');
      expect(false, jsonObject);
      expect(identical(false, jsonObject), true);
      expect(jsonObject is bool, true);
      expect(jsonObject.runtimeType, bool);
    });

    test('Parse and test type of a boolean true object', () {
      var jsonObject = json.decode('true');
      expect(true, jsonObject);
      expect(identical(true, jsonObject), true);
      expect(jsonObject is bool, true);
      expect(jsonObject.runtimeType, bool);
    });

    test('Parse and test type of a String object', () {
      var jsonObject = json.decode('"Simple String"');
      expect('Simple String', jsonObject);
      expect('Simple String' == jsonObject, true);
      expect(jsonObject is String, true);
      expect(jsonObject.runtimeType, String);
    });

    test('Parse and test type of a json array object (dynamic)', () {
      var jsonObject = json.decode('[2, 4, "a", 0]');
      expect([2, 4, 'a', 0], jsonObject);
      expect((jsonObject is List), true);
    });

    test('Parse and test type of a json Array int', () {
      var jsonObject = json.decode('[2, 4, 5, 0]');
      expect([2, 4, 5, 0], jsonObject);
      expect((jsonObject is List), true);
    });

    test('Parse and test type of a json Object', () {
      var jsonObject = json.decode('{"a":2, "c":[2, 4, "a", 0], "d":{"a":9}}');
      // expect([2, 4, "a", 0], jsonObject);
      expect((jsonObject is Map), true);
      Map<String, dynamic> jsonMap = jsonObject;
      var entry_a = jsonMap['a'];
      expect(entry_a, 2);
    });
  });

  group('Parse DiD Document', () {
    test('Canonicalize static did document', () {
      var jsonString = new File('test/did001.json').readAsStringSync();
      var canonicalized = JsonCanonicalizer().canonicalize(jsonString);
      var canonicalString =
          File('test/did001-canonical.json').readAsStringSync();
      expect(canonicalized, canonicalString);
    });
  });

  group('List Sort', () {
    test('Sort list of String natural alphabet', () {
      var entries = <String>['bob', 'anton', 'alice'];
      entries.sort();
      expect(['alice', 'anton', 'bob'], entries);
    });

    test('Sort list of String digit first', () {
      var entries = <String>['bob', 'anton', 'alice', '2marion'];
      entries.sort();
      expect(['2marion', 'alice', 'anton', 'bob'], entries);
    });
  });
}
