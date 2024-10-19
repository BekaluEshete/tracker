import 'package:fitness_tracker/screens/on_noarding/on_boarding.dart';
import 'package:fitness_tracker/shared/color_extension.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TotColors.primaryColor1,
      body: Stack(
        alignment: Alignment.center, // Ensures the elements are aligned
        children: [
          const Center(
            child: Text(
              "Fitnest X",
              style: TextStyle(
                fontSize: 45,
                color:
                    Colors.white, // Add color for contrast against background
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 50, // Position the button at the bottom
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OnBoardingScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: TotColors.primaryColor2, // Button color
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
