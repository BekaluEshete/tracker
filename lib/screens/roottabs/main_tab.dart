import 'package:fitness_tracker/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int selectedIndex = 0;
  List<Widget> Screens = [
    const Home(),
  ];
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 44),
        child: Screens[selectedIndex],
      ),
      bottomNavigationBar: GNav(
        selectedIndex: selectedIndex,
        rippleColor: Colors.grey[800] ??
            Colors.grey, // tab button ripple color when pressed
        hoverColor: Colors.grey[700] ?? Colors.grey, // tab button hover color
        haptic: true, // haptic feedback
        tabBorderRadius: 15,
        tabActiveBorder:
            Border.all(color: Colors.black, width: 1), // tab button border
        tabBorder:
            Border.all(color: Colors.grey, width: 1), // tab button border
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
        ], // tab button shadow
        curve: Curves.linear, // tab animation curves
        duration: const Duration(milliseconds: 500), // tab animation duration
        gap: 4, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        activeColor: Colors.purple, // selected icon and text color
        iconSize: 16, // tab button icon size
        tabBackgroundColor:
            Colors.purple.withOpacity(0.1), // selected tab background color
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // navigation bar padding
        tabs: [
          const GButton(
            icon: LineIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons
                .lineChart, // Replaced LineIcons.chart with LineIcons.barChart
            text: 'Chart',
            onPressed: () {},
          ),
          GButton(
            icon: LineIcons.search,
            text: 'Search',
            onPressed: () {},
          ),
          GButton(
            icon: LineIcons.camera,
            text: 'Camera', // Changed from 'Search' to 'Camera'
            onPressed: () {},
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Profile',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
