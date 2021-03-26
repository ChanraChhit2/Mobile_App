import 'dart:convert';

import 'package:crypto/crypto.dart';

class Mylogin {
  String _pass; //underscore means private

  set password(String value) {
    var bytes = utf8.encode(value);
    var digest = sha1.convert(bytes);
    _pass = digest.toString();
  }

  String get hashPassword {
    return _pass;
  }
}