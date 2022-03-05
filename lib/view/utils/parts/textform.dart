import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextForm extends StatefulWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final textController = TextEditingController();
  String plainText = '';
  String text = '';

  void _updateText() {
    setState(() {
      plainText = textController.text;
      print(plainText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        children: [
          Text(
            plainText,
          ),
          TextField(
            maxLength: 5,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^[\u3040-\u309F]+$')),
            ],
            controller: textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ひらがなで文字を入力してね',
            ),
            onChanged: (letter) {
              text = letter;
              print(text);
            },
          ),
          TextButton(
            child: const Text('Submit'),
            onPressed: _updateText,
          ),
        ],
      ),
    );
  }
}
