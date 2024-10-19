import 'package:fitness_tracker/screens/roottabs/main_tab.dart';
import 'package:fitness_tracker/screens/workout_tracker/workout.dart';
import 'package:flutter/material.dart';

class WellCome extends StatelessWidget {
  const WellCome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            Image.asset("asset/images/welcome.png"),
            const SizedBox(
              height: 17,
            ),
            const Text(
              "Welcome,Sir ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "You are all set now, let’s reach your goals together with us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddWorkoutScreen(),
                    // const RootTab(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  backgroundColor: Colors.blue, // Customize button color
                ),
                child: const Text(
                  "Go to Home",
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
