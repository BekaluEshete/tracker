import 'package:fitness_tracker/screens/workout_tracker/workout_history.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class RecordWorkoutScreen extends StatefulWidget {
  @override
  _RecordWorkoutScreenState createState() => _RecordWorkoutScreenState();
}

class _RecordWorkoutScreenState extends State<RecordWorkoutScreen> {
  FirebaseFirestore fireStore =
      FirebaseFirestore.instance; // Firestore instance

  bool isWorkoutActive = false;
  Duration workoutDuration = Duration.zero;
  Timer? timer;

  // Method to start the workout timer
  void startWorkout() {
    setState(() {
      isWorkoutActive = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        workoutDuration += Duration(seconds: 1);
      });
    });
  }

  // Method to stop the workout timer
  void stopWorkout() {
    timer?.cancel();
    setState(() {
      isWorkoutActive = false;
    });
  }

  // Method to save workout data to Firestore
  Future<void> saveWorkoutData() async {
    await fireStore.collection("workouts").add({
      "duration":
          workoutDuration.inSeconds, // Store total workout duration in seconds
      "date": Timestamp.now(), // Store the current timestamp
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Record Workout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Workout Duration",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "${workoutDuration.inMinutes}:${(workoutDuration.inSeconds % 60).toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isWorkoutActive ? stopWorkout : startWorkout,
              child: Text(isWorkoutActive ? "Pause" : "Start"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                stopWorkout(); // Ensure workout is stopped before saving
                saveWorkoutData(); // Save data to Firestore
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WorkoutHistoryScreen(),
                ));
              },
              child: Text("Finish Workout"),
            ),
          ],
        ),
      ),
    );
  }
}
