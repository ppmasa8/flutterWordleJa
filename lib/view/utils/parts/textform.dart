import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        children: [
          TextField(
            maxLength: 5,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '文字を入力してね',
            ),
            onChanged: (letter) {

            },
          ),
        ],
      ),
    );
  }
}



