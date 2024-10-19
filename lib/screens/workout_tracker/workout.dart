import 'package:fitness_tracker/screens/workout_tracker/recored_workout.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddWorkoutScreen extends StatefulWidget {
  @override
  _AddWorkoutScreenState createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Variables to store user input
  String _selectedExercise = "Running";
  String _duration = "";
  String _distance = "";

  // Method to add data to Firestore
  Future<void> addData() async {
    await fireStore.collection("exercises").add({
      "exercise": _selectedExercise,
      "duration": _duration,
      "distance": _distance,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Add Workout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(child: Text("Running"), value: "Running"),
                DropdownMenuItem(child: Text("Cycling"), value: "Cycling"),
                DropdownMenuItem(
                    child: Text("Weightlifting"), value: "Weightlifting"),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedExercise = value.toString();
                });
              },
              value: _selectedExercise,
              decoration: InputDecoration(labelText: "Workout Type"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Duration (in minutes)"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _duration = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Distance (in km)"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _distance = value;
              },
            ),
            SizedBox(
              height: 13,
            ),
            ElevatedButton(
              onPressed: () {
                addData();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RecordWorkoutScreen(),
                ));
              },
              child: const Text("Save Workout"),
            ),
          ],
        ),
      ),
    );
  }
}
