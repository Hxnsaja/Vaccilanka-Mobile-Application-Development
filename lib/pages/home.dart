import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/aboutus.dart';
import 'package:vaccilanka_mobile_application_development/pages/contactus_page.dart';
import 'package:vaccilanka_mobile_application_development/pages/userinfo.dart';
import 'package:vaccilanka_mobile_application_development/pages/updates.dart';
// import 'package:vaccilanka_mobile_application_development/pages/account_page.dart';
// import 'package:vaccilanka_mobile_application_development/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/logo.png', fit: BoxFit.cover, height: 30),
            const SizedBox(width: 8),
            const Text('Welcome Back, Ann'),
          ],
        ),
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
            Card(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset('assets/teen-vaccines.jpg'),
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
                _buildCategoryButton(
                  iconPath: 'assets/info.jpg',
                  label: 'User Information',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserInfoForm())),
                ),
                _buildCategoryButton(
                  iconPath: 'assets/history.jpg',
                  label: 'Vaccination History',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdatesPage())),
                ),
                _buildCategoryButton(
                  iconPath: 'assets/updates.jpg',
                  label: 'Vaccine Updates',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdatesPage())),
                ),
                _buildCategoryButton(
                  iconPath: 'assets/resources.jpg',
                  label: 'Educational Resources',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  UpdatesPage())),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.blueAccent : Colors.grey),
              onPressed: () {
                setState(() { _selectedIndex = 0; });
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.info_outline, color: _selectedIndex == 1 ? Colors.blueAccent : Colors.grey),
              onPressed: () {
                setState(() { _selectedIndex = 1; });
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            IconButton(
              icon: Icon(Icons.phone, color: _selectedIndex == 2 ? Colors.blueAccent : Colors.grey),
              onPressed: () {
                setState(() { _selectedIndex = 2; });
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: _selectedIndex == 3 ? Colors.blueAccent : Colors.grey),
              onPressed: () {
                setState(() { _selectedIndex = 3; });
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoForm()));
              },
            ),
          ],
        ),
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
