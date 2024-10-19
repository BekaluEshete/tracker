import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import

class WorkoutHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout History"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('workouts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No workout history found"));
          }

          // Fetch workout data
          var workoutList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: workoutList.length,
            itemBuilder: (context, index) {
              var workout = workoutList[index];
              var durationInMinutes =
                  (workout['duration'] / 60).toStringAsFixed(1);

              return ListTile(
                leading: const Icon(Icons.fitness_center),
                title: Text('Workout ${index + 1}'),
                subtitle: Text("$durationInMinutes minutes"),
                trailing: Text("${workout['duration']} kcal"),
              );
            },
          );
        },
      ),
    );
  }
}
