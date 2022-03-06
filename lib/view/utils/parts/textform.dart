import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextForm extends StatefulWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final textController = TextEditingController();
  final plainText = <String>[];
  String text = '';

  void _updateText() {
    setState(() {
      plainText.add(textController.text);
      print(plainText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          for (var elem in plainText) ...{
            Text(elem,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ))
          },
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
