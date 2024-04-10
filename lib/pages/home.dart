import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/aboutus.dart';
import 'package:vaccilanka_mobile_application_development/pages/contactus_page.dart';
import 'package:vaccilanka_mobile_application_development/pages/userinfo.dart';
import 'package:vaccilanka_mobile_application_development/pages/updates.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Widget page;
    switch (index) {
      case 0:
        page =  HomePage();
        break;
      case 1:
        page =  AboutUs();
        break;
      case 2:
        page =  ContactUsPage();
        break;
      case 3:
        page = UserInfoForm();
        break;
      default:
        return;
    }

    if (index != _selectedIndex) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back, Ann'),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/man.png'),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatesPage()));
              },
              child: Image.asset('assets/teen-vaccines.jpg'),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: <Widget>[
                _buildCategoryButton(
                  iconPath: 'assets/info.jpg',
                  label: 'User Information',
                  onTap: () {

                  },
                ),
                _buildCategoryButton(
                  iconPath: 'path_to_your_vaccination_history_image',
                  label: 'Vaccination History',
                  onTap: () {

                  },
                ),
                _buildCategoryButton(
                  iconPath: 'path_to_your_vaccine_updates_image',
                  label: 'Vaccine Updates',
                  onTap: () {

                  },
                ),
                _buildCategoryButton(
                  iconPath: 'path_to_your_educational_resources_image',
                  label: 'Educational Resources',
                  onTap: () {

                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryButton({required String iconPath, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(iconPath, fit: BoxFit.contain),
          ),
          Text(label),
        ],
      ),
    );
  }
}
