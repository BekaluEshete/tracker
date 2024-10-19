import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';

class FitnessTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Tracker Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Progress Overview",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: WorkoutsPerWeekChart(), // Chart to show workouts per week
            ),
            const SizedBox(height: 16),
            Expanded(
              child:
                  CaloriesBurnedChart(), // Chart to show calories burned over time
            ),
          ],
        ),
      ),
    );
  }
}

// Workouts Per Week Chart
class WorkoutsPerWeekChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BarChartGroupData>>(
      stream: getWorkoutsPerWeek(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error fetching data"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No workout data available"));
        }

        return BarChart(
          BarChartData(
            barGroups: snapshot.data!,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return const Text('Mon');
                      case 1:
                        return const Text('Tue');
                      case 2:
                        return const Text('Wed');
                      case 3:
                        return const Text('Thu');
                      case 4:
                        return const Text('Fri');
                      case 5:
                        return const Text('Sat');
                      case 6:
                        return const Text('Sun');
                      default:
                        return const Text('');
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Calories Burned Chart
class CaloriesBurnedChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FlSpot>>(
      stream: getCaloriesBurnedOverTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error fetching data"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No calorie data available"));
        }

        return LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: snapshot.data!,
                isCurved: true,
                color: Colors.orange,
              ),
            ],
          ),
        );
      },
    );
  }
}

// Fetch workouts per week from Firestore
Stream<List<BarChartGroupData>> getWorkoutsPerWeek() async* {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<BarChartGroupData> workoutData = [];

  // Get workouts from the past 7 days
  DateTime now = DateTime.now();
  DateTime startOfWeek = now
      .subtract(Duration(days: now.weekday - 1)); // Start of the week (Monday)

  QuerySnapshot snapshot = await firestore
      .collection('workouts')
      .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfWeek))
      .get();

  // Group workouts by day
  Map<int, int> workoutsPerDay = {
    for (var i = 0; i < 7; i++) i: 0
  }; // Monday to Sunday (0 to 6)

  for (var doc in snapshot.docs) {
    Timestamp timestamp = doc['date'];
    DateTime workoutDate = timestamp.toDate();
    int dayIndex = workoutDate.weekday - 1; // Monday = 0, ..., Sunday = 6

    // Ensure workoutsPerDay[dayIndex] is not null before incrementing
    workoutsPerDay[dayIndex] = (workoutsPerDay[dayIndex] ?? 0) + 1;
  }

  // Create BarChartGroupData for each day
  workoutData = workoutsPerDay.entries.map((entry) {
    return BarChartGroupData(
      x: entry.key,
      barRods: [
        BarChartRodData(
          toY: entry.value.toDouble(), // Replace 'y' with 'toY'
          color: Colors.blue, // You can also set the color of the bar
          width: 20, // You can define the width of the bar
        ),
      ],
    );
  }).toList();

  yield workoutData;
}

// Fetch calories burned over time from Firestore
Stream<List<FlSpot>> getCaloriesBurnedOverTime() async* {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<FlSpot> calorieData = [];

  QuerySnapshot snapshot = await firestore
      .collection('workouts')
      .orderBy('date', descending: false) // Sort by date
      .get();

  int index = 0;

  for (var doc in snapshot.docs) {
    int calories = doc['caloriesBurned'];
    calorieData.add(FlSpot(index.toDouble(), calories.toDouble()));
    index++;
  }

  yield calorieData;
}

class WorkoutHistoryScreen extends StatelessWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout History"),
      ),
      body: ListView.builder(
        itemCount:
            workoutList.length, // Assuming workoutList contains workout data
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text("Workout ${index + 1} "),
            subtitle: Text("${workoutList[index].duration} minutes"),
            trailing: Text("${workoutList[index].caloriesBurned} kcal"),
          );
        },
      ),
    );
  }
}

class Workout {
  int duration;
  int caloriesBurned;

  Workout({required this.duration, required this.caloriesBurned});
}

List<Workout> workoutList = [
  Workout(duration: 30, caloriesBurned: 300),
  Workout(duration: 45, caloriesBurned: 400),
];
