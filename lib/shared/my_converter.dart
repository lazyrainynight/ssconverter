import 'package:flutter/material.dart';
import 'dart:convert';

class MyConverter extends StatefulWidget {
  const MyConverter({Key? key}) : super(key: key);

  @override
  _MyConverterState createState() => _MyConverterState();
}

class _MyConverterState extends State<MyConverter> {
  String value = '';

  String resultBase64Encoding = '';
  String resultBase64Decoding = '';

  String resultBase64UrlEncoding = '';
  String resultBase64UrlDecoding = '';

  String resultUrlEncoding = '';
  String resultUrlDecoding = '';

  String resultDoubleUrlEncoding = '';
  String resultDoubleUrlDecoding = '';

  final TextEditingController txtValue = TextEditingController();
  String inputHint = 'CONVERT THIS';

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: TextField(
            controller: txtValue,
            style: const TextStyle(fontSize: 24),
            decoration: InputDecoration(
              hintText: inputHint,
              filled: true,
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (t) {
              setState(() {
                resultBase64Encoding = getBase64Encoding(t);
                resultBase64Decoding = getBase64Decoding(t);
                resultBase64UrlEncoding = getBase64UrlEncoding(t);
                resultBase64UrlDecoding = getBase64UrlDecoding(t);
                resultUrlEncoding = getUrlEncoding(t);
                resultUrlDecoding = getUrlDecoding(t);
                resultDoubleUrlEncoding = getDoubleUrlEncoding(t);
                resultDoubleUrlDecoding = getDoubleUrlDecoding(t);
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Base64 encoding: ' + resultBase64Encoding),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Base64 decoding: ' + resultBase64Decoding),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child:
                  Text('Base64 URL-safe encoding: ' + resultBase64UrlEncoding),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child:
                  Text('Base64 URL-safe decoding: ' + resultBase64UrlDecoding),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('UrlEncoding: ' + resultUrlEncoding),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('UrlDecoding: ' + resultUrlDecoding),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Double-UrlEncoding: ' + resultDoubleUrlEncoding),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Double-UrlDecoding: ' + resultDoubleUrlDecoding),
            ),
          ],
        ),
      ],
    );
  }

  String getBase64Encoding(String input) {
    return base64Encode(utf8.encode(input));
  }

  String getBase64Decoding(String input) {
    String source = getInputWithPadding(input);

    try {
      return utf8.decode(base64Decode(source));
    } on FormatException {
      return 'INVALID FORMAT';
    }
  }

  String getBase64UrlEncoding(String input) {
    return base64UrlEncode(utf8.encode(input));
  }

  String getBase64UrlDecoding(String input) {
    String source = getInputWithPadding(input);

    try {
      return utf8.decode(base64Url.decode(source));
    } on FormatException {
      return 'INVALID FORMAT';
    }
  }

  String getUrlEncoding(String input) {
    return Uri.encodeFull(input);
  }

  String getUrlDecoding(String input) {
    return Uri.decodeFull(input);
  }

  String getDoubleUrlEncoding(String input) {
    return Uri.encodeFull(Uri.encodeFull(input));
  }

  String getDoubleUrlDecoding(String input) {
    return Uri.decodeFull(Uri.decodeFull(input));
  }

  String getInputWithPadding(String input) {
    var source = input + ('=' * ((4 - (input.length % 4)) % 4));
    return source;
  }
}
