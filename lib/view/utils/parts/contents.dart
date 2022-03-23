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
  static String randomString = Randomizer.Generate();
  final textController = TextEditingController();
  static List<String> plainText = <String>[];
  static List<int> plainTextLength = <int>[];
  static List<int> colorArray = <int>[];
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

// 本当に必要なのか再検討
  // void checkClear() {
  //   if (colorArray[colorArray.length - 5] == 2 &&
  //       colorArray[colorArray.length - 4] == 2 &&
  //       colorArray[colorArray.length - 3] == 2 &&
  //       colorArray[colorArray.length - 2] == 2 &&
  //       colorArray[colorArray.length - 1] == 2) {
  //     print("clear");
  //   }
  // }

  void _updateText() {
    setState(() {
      // 字数が10字に満たない時に空文字列を入れる
      if (textController.text.length < 10) {
        textController.text += " " * (10 - textController.text.length);
      }
      plainText.addAll([textController.text]);
      print(plainText);
      checkStrings(textController.text);
      // checkClear();
      print(colorArray);
      textController.text = '';
      print(randomString);
    });
  }

  void _resetText() {
    setState(() {
      randomString = Randomizer.Generate();
      plainText = <String>[];
      plainTextLength = <int>[];
      colorArray = <int>[];
      text = '';
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
              maxLength: 10,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    // ひらがなとカタカナ以外を弾くregex
                    RegExp(r'^[\u3040-\u30FF]+$')),
              ],
              controller: textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'カタカナで文字を入力してね',
                labelStyle: GoogleFonts.yuseiMagic(),
              ),
              onChanged: (letter) {
                text = letter;
                print(text);
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
              child: Text('決定',
                  style: GoogleFonts.yuseiMagic(
                    fontSize: 20,
                    color: Colors.black,
                  )),
              onPressed: _updateText,
            ),
            TextButton(
              child: Text('リセット',
                  style: GoogleFonts.yuseiMagic(
                    fontSize: 20,
                    color: Colors.black,
                  )),
              onPressed: _resetText,
            ),
          ]),
          Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: Text(
                "位置も文字も合ってる→黒、文字が合ってる→黄、両方あってる→緑",
                style: GoogleFonts.yuseiMagic(
                  fontSize: 10,
                  color: Colors.black,
                ),
              )),
          Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: Text(
                "手数: ${plainText.length.toString()}",
                style: GoogleFonts.yuseiMagic(
                  fontSize: 16,
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
                      color: colorArray[i * 10 + 0] == 0
                          ? Colors.black
                          : colorArray[i * 10 + 0] == 2
                              ? Colors.green
                              : const Color.fromARGB(255, 250, 225, 0),
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: plainText[i][1],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 1] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 1] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][2],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 2] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 2] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][3],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 3] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 3] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][4],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 4] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 4] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                          TextSpan(
                          text: plainText[i][5],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 5] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 5] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][6],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 6] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 6] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][7],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 7] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 7] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: plainText[i][8],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 8] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 8] == 2
                                    ? Colors.green
                                    : const Color.fromARGB(255, 250, 225, 0),
                            fontSize: 20,
                          )),
                          TextSpan(
                          text: plainText[i][9],
                          style: GoogleFonts.yuseiMagic(
                            fontWeight: FontWeight.bold,
                            color: colorArray[i * 10 + 9] == 0
                                ? Colors.black
                                : colorArray[i * 10 + 9] == 2
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
