import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_tracker/screens/login/what_goal.dart';

import 'package:fitness_tracker/screens/on_noarding/start.dart';
import 'package:fitness_tracker/screens/progress_tracker/progress_tracker.dart';
import 'package:fitness_tracker/screens/roottabs/main_tab.dart';
import 'package:fitness_tracker/screens/workout_tracker/workout.dart';
import 'package:fitness_tracker/shared/color_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDA8NZh9SEDyTbKXQAe74XYs86RIdh75Lk",
            appId: "1:38879352746:web:d8e6c99dffe60c76f2fdd3",
            messagingSenderId: "38879352746",
            projectId: "fitness-tracker-bc4b5"));
  }
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker',
      theme: ThemeData(
        primaryColor: TotColors.primaryColor1,
      ),
      home: FitnessTrackerApp(),
      //GetStartedScreen(),
      //const RootTab(),
      // AddWorkoutScreen(),
    );
  }
}
