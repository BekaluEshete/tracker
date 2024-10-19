import 'package:fitness_tracker/shared_widget/welcome.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WhatGoal extends StatefulWidget {
  const WhatGoal({super.key});

  @override
  State<WhatGoal> createState() => _WhatGoalState();
}

class _WhatGoalState extends State<WhatGoal> {
  List<Map<String, String>> goalPages = [
    {
      "image": "asset/images/Goals-1.png",
    },
    {
      "image": "asset/images/Goals-2.png",
    },
    {
      "image": "asset/images/Goals-3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            const Text(
              "What is your goal?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "It will help us to choose the best program for you",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 22,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enableInfiniteScroll: false, // Stop looping
                autoPlay: true, // to automatic slide
                viewportFraction: 0.8, // Adjust image width
                enlargeCenterPage: true, // Highlight the current image
              ),
              items: goalPages.map((goalPage) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        goalPage["image"]!,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WellCome(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  backgroundColor: Colors.blue, // Customize button color
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
