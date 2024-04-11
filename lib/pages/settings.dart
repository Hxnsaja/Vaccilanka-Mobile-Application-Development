import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/contactus.dart';
import 'package:vaccilanka_mobile_application_development/pages/password_security.dart';
import 'package:vaccilanka_mobile_application_development/pages/privacy_policy.dart';
import 'package:vaccilanka_mobile_application_development/pages/home.dart';
import 'package:vaccilanka_mobile_application_development/pages/services/session_manager.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';
import 'package:vaccilanka_mobile_application_development/pages/aboutus.dart';
import 'package:vaccilanka_mobile_application_development/pages/login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF00A1DE);
    final Color secondaryColor = Color(0xFFEBF8F9);

    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage())),
        ),
        title: Text('Settings', style: TextStyle(color: primaryColor)),
        backgroundColor: Color(0xFFEBF8F9),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Image.asset('assets/logo1.png', height: 100, width: 100, fit: BoxFit.contain),
          _buildSettingsItem(
            title: 'Contact Us',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
            },
          ),
          _buildSettingsItem(
            title: 'Password Manager',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordAndSecurity()));
            },
          ),

          _buildSettingsItem(
            title: 'Security and Privacy',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
            },
          ),
          _buildSettingsItem(
            title: 'About Us',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          _buildSettingsItem(
            title: 'Logout',
            onTap: () {
              SessionManager().clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false);
            },
          ),
        ],
      ),


      bottomNavigationBar: BottomNavigation(selectedIndex: 3),
    );
  }

  Widget _buildSettingsItem({required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: onTap,
    );
  }
}

