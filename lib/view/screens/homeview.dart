import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/view/utils/parts/ad_maneger.dart';
import 'package:wordle/view/utils/parts/contents.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.floor();
    int height = (MediaQuery.of(context).size.height * 0.1).floor();

    final SizedBox adContainer = SizedBox(
        height: height.toDouble(),
        width: width.toDouble(),
        child: Center(child: AdManager().getBannerAdWidget(width, height)));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('国名わーどる',
            style: GoogleFonts.yuseiMagic(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Content(),
            adContainer
          ],
        ),
      ),
    );
  }
}
