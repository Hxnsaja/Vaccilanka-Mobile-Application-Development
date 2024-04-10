import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About Us Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutUs(),
    );
  }
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
        padding: EdgeInsets.all(16), // Add padding around the GridView
        child: Center(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 16, // Increase the gap between images
            crossAxisSpacing: 16, // Increase the gap between images
            children: [
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/man.png',
                      size: 120), // Larger image size
                  Text(
                    'Pulindu Hettiarachchi',
                    style: TextStyle(fontWeight: FontWeight.bold), // Bold text
                  ), // Add name below image
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/woman.png',
                      size: 120), // Larger image size
                  Text(
                    'Nethmi Melisha',
                    style: TextStyle(fontWeight: FontWeight.bold), // Bold text
                  ), // Add name below image
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/woman.png',
                      size: 120), // Larger image size
                  Text(
                    'Kavindya Amarasinghe',
                    style: TextStyle(fontWeight: FontWeight.bold), // Bold text
                  ), // Add name below image
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/man.png',
                      size: 120), // Larger image size
                  Text(
                    'Sandun Sahiru',
                    style: TextStyle(fontWeight: FontWeight.bold), // Bold text
                  ), // Add name below image
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/woman.png',
                      size: 120), // Larger image size
                  Text(
                    'Bhagya Gunaratne',
                    style: TextStyle(fontWeight: FontWeight.bold), // Bold text
                  ), // Add name below image
                ],
              ),
              Column(
                children: [
                  DeveloperCard(
                      imageUrl: 'assets/woman.png',
                      size: 120), // Larger image size
                  Text(
                    'Tashini Udeshika',
                    style: TextStyle(fontWeight: FontWeight.bold), // Bold text
                  ), // Add name below image
                ],
              ),
            ],
          ),
        ),
      ),
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
