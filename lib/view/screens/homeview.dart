import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/view/utils/parts/textform.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('わーどる',
          style: GoogleFonts.kosugiMaru(
            color: Colors.black,
          )),
          
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextForm(),
          ],
        ),
      ),
    );
  }
}
