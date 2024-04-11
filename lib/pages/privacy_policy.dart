import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';

class PrivacyPolicyPage extends StatelessWidget {
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
         title: Text('Privacy Policy', style: TextStyle(color: primaryColor)),
        centerTitle: true,
        elevation: 0,
      ),
       backgroundColor: backgroundColor,
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 6.0,
        radius: Radius.circular(10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Privacy Policy\n',
                      style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
                  TextSpan(
                      text:
                          'This Privacy Policy governs the way collects, uses, maintains, and discloses information collected from users\n\n',
                      style: TextStyle(height: 1.5)),
                  TextSpan(
                      text: 'Personal Identification Information\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'We may collect personal identification information from Users in various ways, including but not limited to when Users visit our Site, register on the Site, place an order, subscribe to the newsletter, respond to a survey, fill out a form, and in connection with other activities, services, features, or resources we make available on our Site. Users may be asked for, as appropriate, name, email address, mailing address, phone number, and other relevant information. We will collect personal identification information from Users only if they voluntarily submit such information to us. Users can always refuse to supply personal identification information, except if it may prevent them from engaging in certain Site-related activities.\n\n',
                      style: TextStyle(height: 1.5)),


