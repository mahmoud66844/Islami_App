import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  List<String> tasbeeh = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر"
  ];
  int tasbeehIndex = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter++;
                  angle += 360 / 33;
                  if (counter % 33 == 0) {
                    tasbeehIndex = (tasbeehIndex + 1) % tasbeeh.length;
                    counter = 0;
                  }
                });
              },
              child: Transform.rotate(
                angle: angle,
                child: Image.asset(
                  "assets/images/body_sebha_logo.png",
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              tasbeeh[tasbeehIndex],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$counter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
