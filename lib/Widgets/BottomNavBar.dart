
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/Explore_Screen.dart';
import 'package:untitled2/Screens/acount_screen.dart';
import 'package:untitled2/Screens/weatherhome.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [ExploreScreen(), Weatherhome(), Acount_Screen()];
  int _currentIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        unselectedLabelStyle: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w700, fontSize: 20),
        selectedFontSize: 20,
        iconSize: 20,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex, // Set the current index.
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the state on tab change.
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: Colors.yellow),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.yellow),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.yellow),
            label: user?.displayName ?? 'Account', // Use displayName or default to 'Account'
          ),
        ],
      ),
    );
  }
}
