import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';
import 'package:vaccilanka_mobile_application_development/pages/home.dart';

class EmergencyContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF00A1DE);
    final Color backgroundColor = Color(0xFFEBF8F9);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEBF8F9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage())),
        ),
        title: Text('Emergency Contacts', style: TextStyle(color: primaryColor)),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView( // Changed to ListView to accommodate longer content
          children: [
            EmergencyContactCard(
              title: 'Colombo General Hospital',
              address: 'Address: The National Hospital of Sri Lanka, Colombo 10.',
              otherInfo: 'Inquiries: +9411-2693510\nAccident Service: +9411-2691111',
            ),
            EmergencyContactCard(
              title: 'Certis Lanka Ambulance',
              address: 'Address: 120 Havelock Rd, Colombo 00500',
              otherInfo: 'Hours: Open 24 hours\nPhone: 0112 585 777',
            ),
            EmergencyContactCard(
              title: 'Government Hospital Homagama',
              address: 'Address: Hospital Rd, Homagama 10200',
              otherInfo: 'Hours: Open 24 hours\nPhone: 0112 855 200',
            ),
            // Add more EmergencyContactCards if needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 2), // Assuming index 2 is for the Emergency page
    );
  }
}

class EmergencyContactCard extends StatelessWidget {
  final String title;
  final String address;
  final String otherInfo;

  const EmergencyContactCard({
    Key? key,
    required this.title,
    required this.address,
    required this.otherInfo,
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
            Text(address, style: TextStyle(color: Colors.black54)),
            SizedBox(height: 8),
            Text(otherInfo, style: TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
