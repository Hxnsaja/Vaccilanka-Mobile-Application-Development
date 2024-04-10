import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/home.dart';
import 'package:vaccilanka_mobile_application_development/pages/emergency.dart';
import 'package:vaccilanka_mobile_application_development/pages/userinfo.dart';
import 'package:vaccilanka_mobile_application_development/pages/settings.dart';

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;

  const BottomNavigation({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void _onItemTapped(int index) {
    if (index != widget.selectedIndex) {
      switch (index) {
        case 0:
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
          break;
        case 1:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => EmergencyContactsPage()));
          break;
        case 2:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => UserInfoForm()));
          break;
        case 3:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => SettingsPage()));
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFF6895D2);
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: backgroundColor,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert, color: Colors.white),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Settings',
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
