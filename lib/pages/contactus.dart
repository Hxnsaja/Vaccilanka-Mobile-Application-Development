import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF00A1DE);
    final Color backgroundColor = Color(0xFFEBF8F9);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEBF8F9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Contact Us', style: TextStyle(color: primaryColor)),

        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ContactDetailCard(
              title: 'Colombo General Hospital',
              address: 'The National Hospital of Sri Lanka, Colombo 10.',
              phoneNumber: '+9411-2691111',
            ),
            SizedBox(height: 20),
            ContactDetailCard(
              title: 'Colombo General Hospital - IT Support',
              address: 'The National Hospital of Sri Lanka, Colombo 10.',
              phoneNumber: '+9411-2693510',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 3),
    );
  }
}

class ContactDetailCard extends StatelessWidget {
  final String title;
  final String address;
  final String phoneNumber;

  const ContactDetailCard({
    Key? key,
    required this.title,
    required this.address,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Address: $address', style: TextStyle(color: Colors.black54)),
            SizedBox(height: 8),
            Text('National Hospital: $phoneNumber', style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
