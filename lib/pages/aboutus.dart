import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/home.dart';
import 'package:vaccilanka_mobile_application_development/pages/contactus_page.dart';
import 'package:vaccilanka_mobile_application_development/pages/userinfo.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';



class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text(
            'About Us',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xFFEBF8F9),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 60,
                height: 80,
                child: Image.asset(
                  'assets/logo1.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFEBF8F9),
        padding: EdgeInsets.all(16),
        child: Center(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/man.png',
                      size: 120),
                  Text(
                    'Pulindu Hettiarachchi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/woman.png',
                      size: 120),
                  Text(
                    'Nethmi Melisha',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/woman.png',
                      size: 120),
                  Text(
                    'Kavindya Amarasinghe',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/man.png',
                      size: 120),
                  Text(
                    'Sandun Sahiru',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/woman.png',
                      size: 120),
                  Text(
                    'Bhagya Gunaratne',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/woman.png',
                      size: 120),
                  Text(
                    'Tashini Udeshika',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 3),
    );
  }
}
class DeveloperCard extends StatelessWidget {
  final String imageUrl;
  final double size;

  const DeveloperCard({required this.imageUrl, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8), // Add padding around the image
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain,
          width: 120, // Use the specified size
          height: 120, // Use the specified size
        ),
      ),
    );
  }
}