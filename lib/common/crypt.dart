import 'dart:convert';

class Crypt {
  final Codec<String, String> _stringToBase64Url = utf8.fuse(base64Url);

  String encode(String text) {
    String encoded = _stringToBase64Url.encode(text);
    return encoded;
  }

  String decode(String text) {
    String decoded = _stringToBase64Url.decode(text);
    return decoded;
  }
}