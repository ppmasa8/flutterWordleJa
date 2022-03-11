import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
      margin: const EdgeInsets.only(top: 12.0),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextField(
              maxLength: 5,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    // ひらがな以外を弾くregex
                    RegExp(r'^[\u3040-\u309F]+$')),
              ],
              controller: textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'ひらがなで文字を入力してね',
                labelStyle: GoogleFonts.yuseiMagic(),
              ),
              onChanged: (letter) {
                text = letter;
                print(text);
              },
            ),
          ),
          TextButton(
            child: Text('決定',
                style: GoogleFonts.yuseiMagic(
                  fontSize: 20,
                  color: Colors.black,
                )),
            onPressed: _updateText,
          ),
          Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: Text(
                "手数: ${plainText.length.toString()}",
                style: GoogleFonts.yuseiMagic(
                  fontSize: 16,
                  color: Colors.black,
                ),
              )),
          for (var elem in plainText) ...{
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(elem,
                    style: GoogleFonts.yuseiMagic(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ))),
          },
        ],
      ),
    );
  }
}
