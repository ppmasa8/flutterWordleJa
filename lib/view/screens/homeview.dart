import 'package:flutter/material.dart';
import 'package:wordle/view/utils/parts/textform.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('わーどる')
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 350,
              color: Colors.red,
            ),
            TextForm(),
          ],
        ),
      ),
    );
  }
}
