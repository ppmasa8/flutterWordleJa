import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// できればアプリ内に出てくる文字のフォントをGoogleFontsのyuseimagicに統一して砕けた感じにしたい。

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
      textController.text = '';
      print(plainText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
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
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ひらがなで文字を入力してね',
              labelStyle: GoogleFonts.yuseiMagic(
              ),
            ),
            onChanged: (letter) {
              text = letter;
              print(text);
            },
          ),
          TextButton(
            child: Text('決定',
            style: GoogleFonts.yuseiMagic(
              color: Colors.black,
            )),
            onPressed: _updateText,
          ),
          Text(plainText.length.toString(),
              style: const TextStyle(
                fontSize: 20,
              ))
        ],
      ),
    );
  }
}
