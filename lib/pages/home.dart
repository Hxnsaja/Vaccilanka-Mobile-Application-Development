import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/aboutus.dart';
import 'package:vaccilanka_mobile_application_development/pages/contactus_page.dart';
import 'package:vaccilanka_mobile_application_development/pages/resources.dart';
import 'package:vaccilanka_mobile_application_development/pages/userinfo.dart';
import 'package:vaccilanka_mobile_application_development/pages/updates.dart';
import 'package:vaccilanka_mobile_application_development/pages/settings.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;


  final Color appBarColor = Color(0xFFEBF8F9);
  final Color backgroundColor = Color(0xFFEBF8F9);
  final Color bottomBarColor = Color(0xFFEEEEEE);
  final Color cardBackgroundColor = Colors.white;
  final Color primaryTextColor = Color(0xFF333333);
  final Color secondaryTextColor = Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF8F9),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/logo.png', fit: BoxFit.cover, height: 30),
            const SizedBox(width: 8),
            Text('Welcome Back, Ann', style: TextStyle(color: primaryTextColor)),
          ],
        ),
        backgroundColor: Color(0xFFEBF8F9),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/man.png'),
            onPressed: () {
              // Handle user icon action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              color: cardBackgroundColor,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset('assets/teen-vaccines.jpg', fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Latest News',
                      style: TextStyle(
                        backgroundColor: Colors.black.withOpacity(0.5),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: <Widget>[
                _buildCategoryCard(iconPath: 'assets/info.png', label: 'User Information'),
                _buildCategoryCard(iconPath: 'assets/history.png', label: 'Vaccination History'),
                _buildCategoryCard(iconPath: 'assets/updates.png', label: 'Vaccine Updates'),
                _buildCategoryCard(iconPath: 'assets/resources.png', label: 'Educational Resources'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 0),
    );
  }

  Widget _buildCategoryCard({required String iconPath, required String label}) {
    Color cardBackgroundColor = Colors.white;
    Color secondaryTextColor = Colors.black;

    return Card(
      color: cardBackgroundColor,
      child: InkWell(
        onTap: () {
          switch (label) {
            case 'User Information':
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoForm()));
              break;
            case 'Vaccination History':
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatesPage()));
              break;
            case 'Vaccine Updates':
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatesPage()));
              break;
            case 'Educational Resources':
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResourcesPage()));
              break;
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 64, height: 64, fit: BoxFit.contain),
            SizedBox(height: 8),
            Text(label, style: TextStyle(color: secondaryTextColor)),
          ],
        ),
      ),
    );
  }

}
