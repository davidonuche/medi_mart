import 'package:flutter/material.dart';
import 'utils/colors.dart';
import 'screens/community_screen.dart';
import 'screens/doctor_screen.dart';
import 'screens/home_screen.dart';
import 'screens/pharmacy_screen.dart';
import 'screens/profile_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeScreen(),
            DoctorScreen(),
            PharmacyScreen(),
            CommunityScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.mainColor,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_shopping_cart),
            label: 'Pharmacy',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.forum),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: AppColor.kdarkblue,
      ),
    );
  }
}
