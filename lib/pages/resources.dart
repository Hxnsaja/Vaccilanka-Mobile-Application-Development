import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart'; // Assuming this is the correct path to your BottomNavigation widget

class ResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Resources'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0), // Add padding around the list view
        child: buildArticleList(context),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 0),
    );
  }

  Widget buildArticleList(BuildContext context) {
    // This function creates the list of articles
    return ListView(
      children: <Widget>[
        SizedBox(height: 8.0), // Adds space before the first card
        buildArticleCard(context, 'assets/post1.jpeg', 'New Covid Boosters - What Doctors need to say...'),
        SizedBox(height: 8.0), // Adds space between the cards
        buildArticleCard(context, 'assets/post2.jpeg', 'Polio side effects for 80+ Adults you should know...'),
        SizedBox(height: 8.0), // Adds space between the cards
        buildArticleCard(context, 'assets/post3.jpeg', 'Does the future of our children are safe...'),
        SizedBox(height: 8.0), // Adds space after the last card
      ],
    );
  }

  Widget buildArticleCard(BuildContext context, String imagePath, String overlayText) {
    // This function creates a card for an article
    return GestureDetector(
      onTap: () => navigateToArticlePage(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer, // Clip the image to the card's shape
        child: Stack(
          alignment: Alignment.bottomCenter, // Aligns overlay text to the bottom center
          children: <Widget>[
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0, // Fixed height for uniformity
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.0), // Padding for the text
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              child: Text(
                overlayText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToArticlePage(BuildContext context) {
    // Function to navigate to the ArticlePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ArticlePage()),
    );
  }
}

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: Center(
        child: Text('Content of the article goes here.'),
      ),
    );
  }
}
