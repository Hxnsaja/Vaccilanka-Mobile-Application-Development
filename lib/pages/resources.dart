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
