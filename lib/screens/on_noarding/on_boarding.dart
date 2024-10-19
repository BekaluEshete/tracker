import 'package:fitness_tracker/screens/login/signup.dart';
import 'package:fitness_tracker/shared_widget/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/shared/color_extension.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int selectedPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        selectedPage = controller.page?.round() ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List listOfpages = [
      {
        "image": "asset/images/1.png",
        "tittle": "Track Your Goal",
        "subtitle":
            "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"
      },
      {
        "image": "asset/images/2.png",
        "tittle": "Get burn",
        "subtitle":
            "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"
      },
      {
        "image": "asset/images/3.png",
        "tittle": "Eat Well",
        "subtitle":
            "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun"
      },
      {
        "image": "asset/images/4.png",
        "tittle": "Improve Sleep  Quality",
        "subtitle":
            "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning"
      },
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller, // Attach the controller to the PageView
            itemCount: listOfpages.length,
            itemBuilder: (context, index) {
              return OnboardingPage(
                pageObj: listOfpages[index],
              );
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: TotColors.primaryColor1,
              borderRadius: BorderRadius.circular(35),
            ),
            child: IconButton(
              onPressed: () {
                if (selectedPage < listOfpages.length - 1) {
                  // Move to the next page
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Navigate to the next screen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ));
                }
              },
              icon: Icon(
                selectedPage < listOfpages.length - 1
                    ? Icons.navigate_next
                    : Icons.check, // Change icon based on current page
                color: TotColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
