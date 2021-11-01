import 'package:flutter/material.dart';

class MyConverter extends StatefulWidget {
  const MyConverter({Key? key}) : super(key: key);

  @override
  _MyConverterState createState() => _MyConverterState();
}

class _MyConverterState extends State<MyConverter> {
  String value = '';
  String base64 = '';
  String base64WithPadding = '';
  String urlEncoding = '';
  String doubleUrlEncoding = '';
  final TextEditingController txtValue = TextEditingController();
  String inputHint = 'Please insert here.';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: TextField(
            controller: txtValue,
            decoration: InputDecoration(hintText: inputHint),
            onChanged: (t) {
              setState(() {
                base64 = t;
                base64WithPadding = t;
                urlEncoding = t;
                doubleUrlEncoding = t;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('Base64: ' + base64),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('Base64 with padding: ' + base64WithPadding),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('UrlEncoding: ' + urlEncoding),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('Double-UrlEncoding: ' + doubleUrlEncoding),
        ),
      ],
    );
  }
}
