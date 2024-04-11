import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';

class ResourcesPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Resources'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: buildArticleList(context),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 0),
    );
  }
    Widget buildArticleList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('education').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(child: Text("No Educational Resources found."));
        }

        return ListView(
          children: snapshot.data!.docs.map((document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return buildArticleCard(context, data['image'], data['title']);
          }).toList(),
        );
      },
    );
  }
   Widget buildArticleCard(BuildContext context, String imagePath, String overlayText) {
    // This function creates a card for an article
    return GestureDetector(
      onTap: () => navigateToArticlePage(context, overlayText),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              color: Colors.black.withOpacity(0.5),
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


