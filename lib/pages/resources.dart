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

