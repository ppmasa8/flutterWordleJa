import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/view/utils/parts/random.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final randomString = Randomizer.Generate();
  final textController = TextEditingController();
  final plainText = <String>[];
  final plainTextLength = <int>[];
  final colorArray = <int>[];
  String text = '';

  void checkStrings(String text) {
    for (int i = 0; i < text.length; i++) {
      if (randomString[i] == text[i]) {
        colorArray.add(2);
      } else if (randomString.contains(text[i])) {
        colorArray.add(1);
      } else {
        colorArray.add(0);
      }
    }
  }

  void _updateText() {
    setState(() {
      plainText.addAll([textController.text]);
      print(plainText);
      checkStrings(textController.text);
      print(colorArray);
      textController.text = '';
      print(randomString);
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
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "位置も文字も合ってる→黒、文字が合ってる→黄、両方あってる→緑",
                style: GoogleFonts.yuseiMagic(
                  fontSize: 10,
                  color: Colors.black,
                ),
              )),
          for (int i = 0; i < plainText.length; i++) ...{
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text.rich(
                TextSpan(
                    text: plainText[i][0],
                    style: GoogleFonts.yuseiMagic(
                      fontWeight: FontWeight.bold,
                      // 位置も文字も合っていない場合は黒、
                      // 文字が合っている場合は黄色、
                      // 両方あっている場合は緑
                      color: colorArray[i * 5 + 0] == 0
                          ? Colors.black
                          : colorArray[i * 5 + 0] == 2
                              ? Colors.green
                              : const Color.fromARGB(255, 250, 225, 0),
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: plainText[i][1] != null ? plainText[i][1] : "",
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            // 位置も文字も合っていない場合は黒、
                            // 文字が合っている場合は黄色、
                            // 両方あっている場合は緑
                            color: colorArray[i * 5 + 1] == 0
                                ? Colors.black
                                : colorArray[i * 5 + 1] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][2] != null ? plainText[i][2] : "",
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            // 位置も文字も合っていない場合は黒、
                            // 文字が合っている場合は黄色、
                            // 両方あっている場合は緑
                            color: colorArray[i * 5 + 2] == 0
                                ? Colors.black
                                : colorArray[i * 5 + 2] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][3] != null ? plainText[i][3] : "",
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            // 位置も文字も合っていない場合は黒、
                            // 文字が合っている場合は黄色、
                            // 両方あっている場合は緑
                            color: colorArray[i * 5 + 3] == 0
                                ? Colors.black
                                : colorArray[i * 5 + 3] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][4] != null ? plainText[i][4] : "",
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            // 位置も文字も合っていない場合は黒、
                            // 文字が合っている場合は黄色、
                            // 両方あっている場合は緑
                            color: colorArray[i * 5 + 4] == 0
                                ? Colors.black
                                : colorArray[i * 5 + 4] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      const TextSpan(text: "\n"),
                    ]),
              ),
            ),
          },
        ],
      ),
    );
  }
}
