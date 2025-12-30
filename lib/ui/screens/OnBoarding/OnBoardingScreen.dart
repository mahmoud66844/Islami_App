import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/main/main.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModel(
      {required this.image, required this.title, required this.subTitle});
}

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoarding";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: "assets/images/Welcome.png",
        title: "Welcome To Islami App",
        subTitle: ""),
    OnBoardingModel(
        image: "assets/images/kabba.png",
        title: "Welcome To Islami",
        subTitle: "We Are Very Excited To Have You In Our Community"),
    OnBoardingModel(
        image: "assets/images/reading.png",
        title: "Reading the Quran",
        subTitle: "Read, and your Lord is the Most Generous"),
    OnBoardingModel(
        image: "assets/images/bearish.png",
        title: "Tasbeeh",
        subTitle: "Praise the name of your Lord, the Most High"),
    OnBoardingModel(
        image: "assets/images/radio.png",
        title: "Holy Quran Radio",
        subTitle:
        "You can listen to the Holy Quran Radio through the application for free and easily"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset(
              "assets/images/islami_logo.png",
              height: 200,
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                if (boardController.hasClients && boardController.page != 0)
                  TextButton(
                    onPressed: () {
                      boardController.previousPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 18, color: AppColors.gold),
                    ),
                  ),

                const Spacer(),

                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.gold,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5),
                ),
                const Spacer(),

                TextButton(
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushReplacementNamed(context, Main.routeName);
                    } else {
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Text(
                    isLast ? "Finish" : "Next",
                    style: const TextStyle(fontSize: 18, color: AppColors.gold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget buildBoardingItem(OnBoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(child: Image(image: AssetImage(model.image))),
      const SizedBox(
        height: 50,
      ),
      Text(
        model.title,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.gold),
      ),
      const SizedBox(
        height: 40,
      ),
      Text(
        model.subTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.gold), // Changed to white to match design
      ),
    ],
  );
}
