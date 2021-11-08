import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  bool base64EnError = false;
  bool base64DeError = false;
  bool base64UrlEnError = false;
  bool base64UrlDeError = false;
  bool urlEnError = false;
  bool urlDeError = false;
  bool doubleUrlEnError = false;
  bool doubleUrlDeError = false;

  String inputHint = 'CONVERT THIS';
  String invalidInput = 'INVALID INPUT for this conversion';

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
            onTap: () {
              txtValue.selection = TextSelection(baseOffset: 0, extentOffset: txtValue.value.text.length);
            },
            onChanged: (t) {
              setState(() {
                disableErrors();
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
          getResultBox('Base64 Encoding', base64En, base64EnError),
          getResultBox('Base64 Decoding', base64De, base64DeError),
          getResultBox('Base64Url Encoding', base64UrlEn, base64UrlEnError),
          getResultBox('Base64Url Decoding', base64UrlDe, base64UrlDeError),
          getResultBox('Url Encoding (UTF-8)', urlEn, urlEnError),
          getResultBox('Url Decoding (UTF-8)', urlDe, urlDeError),
          getResultBox(
              'Double-Url Encoding (UTF-8)', doubleUrlEn, doubleUrlEnError),
          getResultBox(
              'Double-Url Decoding (UTF-8)', doubleUrlDe, doubleUrlDeError),
        ],
      ),
    );
  }

  Widget getResultBox(
      String label, TextEditingController controller, bool error) {
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
          onPressed: error ? null : () {
            Clipboard.setData(ClipboardData(text: controller.text));
            // todo: unselect all text fields
            controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.value.text.length);
          },
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
                // icon: IconButton(
                //   icon: const Icon(Icons.copy),
                //   onPressed: error ? null : () {},
                // ),
                labelText: label,
                filled: true,
                fillColor: error
                    ? const Color.fromARGB(255, 172, 72, 72)
                    : const Color.fromARGB(255, 72, 72, 72),
                border: const OutlineInputBorder(),
              ),
              readOnly: true,
              controller: controller,
              onTap: () {
                controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.value.text.length);
              },
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
    } on ArgumentError {
      base64DeError = true;
      return invalidInput;
    } on FormatException {
      base64DeError = true;
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
    } on ArgumentError {
      base64UrlDeError = true;
      return invalidInput;
    } on FormatException {
      base64UrlDeError = true;
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
      urlDeError = true;
      return invalidInput;
    } on FormatException {
      urlDeError = true;
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
      doubleUrlDeError = true;
      return invalidInput;
    } on FormatException {
      doubleUrlDeError = true;
      return invalidInput;
    }
  }

  String getInputWithPadding(String input) {
    return input + ('=' * ((4 - (input.length % 4)) % 4));
  }

  void disableErrors() {
    base64EnError = false;
    base64DeError = false;
    base64UrlEnError = false;
    base64UrlDeError = false;
    urlEnError = false;
    urlDeError = false;
    doubleUrlEnError = false;
    doubleUrlDeError = false;
  }
}
