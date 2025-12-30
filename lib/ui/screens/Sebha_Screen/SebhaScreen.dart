import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  static const String routeName = "sebha";const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  List<String> tasbeeh = ["سبحان الله", "الحمد لله", "الله اكبر"];
  int tasbeehIndex = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/sebha_bg.png"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 4),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/islami_logo.png"),
                    const SizedBox(height: 20),
                    const Text(
                      "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 12,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                        angle += 360 / 33;
                        if (counter == 33) {
                          tasbeehIndex = (tasbeehIndex + 1) % tasbeeh.length;
                          counter = 0;
                        }
                      });
                    },
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        "assets/images/Sebha_Body.png",
                        height: mediaQuery.height * 0.50,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffB7935F).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          tasbeeh[tasbeehIndex],
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 26,),
                      const Text(
                        "عدد التسبيحات",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 26,),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                          color: const Color(0xffB7935F).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          "$counter",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
