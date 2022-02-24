import 'dart:convert';

class Crypt {
  static String encode(String text) {
    String encoded = utf8.fuse(base64Url).encode(text);
    return encoded;
  }

  static String decode(String text) {
    String decoded = utf8.fuse(base64Url).decode(text);
    return decoded;
  }
}