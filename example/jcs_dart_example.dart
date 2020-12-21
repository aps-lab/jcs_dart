import 'dart:io';

import 'package:jcs_dart/jcs_dart.dart';

void main() {
  // var awesome = Awesome();
  // print('awesome: ${awesome.isAwesome}');

  var jsonString = File('test/did001.json').readAsStringSync();
  var canonicalized = JsonCanonicalizer().canonicalize(jsonString);
  // var canonicalString = File('test/did001-canonical.json').readAsStringSync();

  print('Json Input test/did001.json : \n${jsonString}\n');
  print('Canonicalized : \n${canonicalized}\n');
  print('Result  matches test/did001-canonical.json: \n${canonicalized}\n');
}
