import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:fitness_tracker/shared/color_extension.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    List<fl.PieChartSectionData> _buildSections() {
      double radius = media.width * 0.12;
      return [
        fl.PieChartSectionData(
          color: Colors.blue,
          value: 15,
          title: 'Underweight',
          radius: radius,
          titleStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
        fl.PieChartSectionData(
          color: Colors.green,
          value: 50,
          title: 'Normal',
          radius: radius,
          titleStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
        fl.PieChartSectionData(
          color: Colors.orange,
          value: 20,
          title: 'Overweight',
          radius: radius,
          titleStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
        fl.PieChartSectionData(
          color: Colors.red,
          value: 15,
          title: 'Obese',
          radius: radius,
          titleStyle: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
      ];
    }

    return Scaffold(
      backgroundColor: TotColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, Back",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Bekalu Eshete",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_active),
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.05),
              Container(
                height: media.width * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: TotColors.primaryG),
                  borderRadius: BorderRadius.circular(media.width * 0.076),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BMI (Body Mass Index)",
                                style: TextStyle(
                                  color: TotColors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "You have a normal weight",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: TotColors.white,
                                ),
                              ),
                              SizedBox(height: media.width * 0.08),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: TotColors.secondaryColor2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text('View More',
                                    style: TextStyle(color: TotColors.white)),
                              )
                            ],
                          ),
                          Expanded(
                            child: fl.PieChart(
                              fl.PieChartData(
                                sections: _buildSections(),
                                borderData: fl.FlBorderData(show: false),
                                centerSpaceRadius: 10,
                                sectionsSpace: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: media.width * 0.05),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      TotColors.primaryColor1.withOpacity(0.3),
                      TotColors.primaryColor1.withOpacity(0.3),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Target Today",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Check"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            TotColors.primaryColor1.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: media.width * 0.05),
              const Text(
                "Activity status",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: media.width * 0.017),
              Container(
                height: media.width * 0.4,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      TotColors.primaryColor1.withOpacity(0.3),
                      TotColors.primaryColor1.withOpacity(0.3),
                    ],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Heart Rate",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 12),
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return const LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.orange,
                                  Colors.purple
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode
                                .srcIn, // This controls how the shader blends with the text
                            child: const Text(
                              "78 BPM",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: fl.LineChart(
                          fl.LineChartData(
                            gridData: fl.FlGridData(show: false),
                            titlesData: fl.FlTitlesData(show: false),
                            borderData: fl.FlBorderData(show: false),
                            lineBarsData: [
                              fl.LineChartBarData(
                                spots: [
                                  fl.FlSpot(0, 60),
                                  fl.FlSpot(1, 75),
                                  fl.FlSpot(2, 50),
                                  fl.FlSpot(3, 80),
                                  fl.FlSpot(4, 40),
                                  fl.FlSpot(5, 70),
                                  fl.FlSpot(6, 55),
                                  fl.FlSpot(7, 90),
                                ],
                                isCurved: true,
                                color: TotColors.primaryColor1,
                                belowBarData: fl.BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                    colors: [
                                      TotColors.primaryColor1.withOpacity(0.3),
                                      TotColors.primaryColor1.withOpacity(0.1),
                                    ],
                                  ),
                                ),
                                dotData: fl.FlDotData(show: true),
                              ),
                            ],
                            lineTouchData: fl.LineTouchData(
                              touchTooltipData: fl.LineTouchTooltipData(
                                //tooltipBgColor: Colors.blueAccent,

                                getTooltipItems:
                                    (List<fl.LineBarSpot> touchedSpots) {
                                  return touchedSpots
                                      .map((fl.LineBarSpot touchedSpot) {
                                    final timeAgo =
                                        "${(touchedSpot.x * 10).toInt()} min ago";
                                    return fl.LineTooltipItem(
                                      timeAgo,
                                      const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                              touchCallback: (fl.FlTouchEvent event,
                                  fl.LineTouchResponse? touchResponse) {
                                if (!event.isInterestedForInteractions ||
                                    touchResponse == null) {
                                  return;
                                }
                              },
                              handleBuiltInTouches: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: media.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 200, 197, 197),
                            blurRadius: 2,
                            //  // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SimpleAnimationProgressBar(
                              height: media.width * 0.85,
                              width: 15,
                              backgroundColor: Colors.grey,
                              foregrondColor: TotColors.primaryColor2,
                              ratio: 0.5,
                              direction: Axis.vertical,
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 3),
                              borderRadius:
                                  BorderRadius.circular(media.width * 0.1),
                              gradientColor: LinearGradient(
                                  colors: TotColors.primaryG,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                          ),
                          SizedBox(
                            width: media.width * 0.03,
                          ),
                          Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 11)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Water Intake",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 12),
                                  ShaderMask(
                                    shaderCallback: (bounds) {
                                      return const LinearGradient(
                                        colors: [
                                          Colors.red,
                                          Colors.orange,
                                          Colors.purple
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(bounds);
                                    },
                                    blendMode: BlendMode
                                        .srcIn, // This controls how the shader blends with the text
                                    child: const Text(
                                      "4 Litres",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Real Time Update",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.025,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          height: media.width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 200, 197, 197),
                                blurRadius: 2,
                                //  // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          height: media.width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 200, 197, 197),
                                blurRadius: 2,
                                //  // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
