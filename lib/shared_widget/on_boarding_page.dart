import 'package:flutter/material.dart';
import 'package:fitness_tracker/shared/color_extension.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({required this.pageObj, super.key});
  final Map<String, String> pageObj;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return SizedBox(
      width: media.width,
      height: media.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(pageObj['image']!,
                width: media.width, fit: BoxFit.fitWidth),
            SizedBox(
              height: media.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(pageObj['tittle']!,
                  style: TextStyle(
                      color: TotColors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w800)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(pageObj['subtitle']!,
                  style: TextStyle(
                    color: TotColors.grayy,
                    fontSize: 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
