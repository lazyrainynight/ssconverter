import 'package:flutter/material.dart';
import 'dart:convert';

class MyConverter extends StatefulWidget {
  const MyConverter({Key? key}) : super(key: key);

  @override
  _MyConverterState createState() => _MyConverterState();
}

class _MyConverterState extends State<MyConverter> {
  final TextEditingController txtValue = TextEditingController();
  final TextEditingController base64En = TextEditingController();
  final TextEditingController base64De = TextEditingController();
  final TextEditingController base64UrlEn = TextEditingController();
  final TextEditingController base64UrlDe = TextEditingController();
  final TextEditingController urlEn = TextEditingController();
  final TextEditingController urlDe = TextEditingController();
  final TextEditingController doubleUrlEn = TextEditingController();
  final TextEditingController doubleUrlDe = TextEditingController();

  String inputHint = 'CONVERT THIS';
  String invalidInput = 'INVALID INPUT';

  double _sizeX = 500;

  @override
  Widget build(BuildContext context) {
    _sizeX = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
      child: Column(
        children: <Widget>[
          TextField(
            controller: txtValue,
            maxLines: null,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              labelText: inputHint,
              filled: true,
              border: const OutlineInputBorder(),
            ),
            onChanged: (t) {
              setState(() {
                base64En.text = getBase64Encoding(t);
                base64De.text = getBase64Decoding(t);
                base64UrlEn.text = getBase64UrlEncoding(t);
                base64UrlDe.text = getBase64UrlDecoding(t);
                urlEn.text = getUrlEncoding(t);
                urlDe.text = getUrlDecoding(t);
                doubleUrlEn.text = getDoubleUrlEncoding(t);
                doubleUrlDe.text = getDoubleUrlDecoding(t);
              });
            },
          ),
          const SizedBox(height: 30),
          getResultTextField('Base64 Encoding', base64En),
          getResultTextField('Base64 Decoding', base64De),
          getResultTextField('Base64Url Encoding', base64UrlEn),
          getResultTextField('Base64Url Decoding', base64UrlDe),
          getResultTextField('Url Encoding (UTF-8)', urlEn),
          getResultTextField('Url Decoding (UTF-8)', urlDe),
          getResultTextField('Double-Url Encoding (UTF-8)', doubleUrlEn),
          getResultTextField('Double-Url Decoding (UTF-8)', doubleUrlDe),
        ],
      ),
    );
  }

  Widget getResultTextField(String label, TextEditingController controller) {
    final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      primary: Colors.amber,
      minimumSize: const Size(100, 55),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );

    return Row(
      children: [
        OutlinedButton(
          onPressed: () {},
          style: buttonStyle,
          child: const Icon(Icons.copy),
        ),
        SizedBox(
          width: _sizeX - 200,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: label,
                filled: true,
                border: const OutlineInputBorder(),
              ),
              readOnly: true,
              controller: controller,
            ),
          ),
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
      return invalidInput;
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
      return invalidInput;
    }
  }

  String getUrlEncoding(String input) {
    return Uri.encodeFull(input);
  }

  String getUrlDecoding(String input) {
    try {
      return Uri.decodeFull(input);
    } on ArgumentError {
      return invalidInput;
    } on FormatException {
      return invalidInput;
    }
  }

  String getDoubleUrlEncoding(String input) {
    return Uri.encodeFull(Uri.encodeFull(input));
  }

  String getDoubleUrlDecoding(String input) {
    try {
      return Uri.decodeFull(Uri.decodeFull(input));
    } on ArgumentError {
      return invalidInput;
    } on FormatException {
      return invalidInput;
    }
  }

  String getInputWithPadding(String input) {
    return input + ('=' * ((4 - (input.length % 4)) % 4));
  }
}
