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
                       style: TextStyle(height: 1.5)),
                  TextSpan(
                      text: 'Non-personal Identification Information\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'We may collect non-personal identification information about Users whenever they interact with our Site. Non- personal identification information may include the browser name, the type of computer or device, and technical information about Users means of connection to our Site, such as the operating system and the Internet service providers utilized and other similar information.\n\n',
                      style: TextStyle(height: 1.5)),
                  TextSpan(
                      text: 'How We Use Collected Information\n',
                      style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
                  TextSpan(
                      text:
                          'Our system developers may collect and use Users personal information for the following purposes:\n',
                      style: TextStyle(height: 1.5)),
                  TextSpan(
                      text:
                          '- To improve customer service: Information you provide helps us respond to your customer service requests and support needs more efficiently.\n',
                      style: TextStyle(height: 1.5)),
                  TextSpan(
                      text:
                          '- To personalize user experience: We may use information in the aggregate to understand how our Users as a group use the services and resources provided on our Site.\n',
                      style: TextStyle(height: 1.5)),
                  TextSpan(
                      text:
                          '- To improve our Site: We may use feedback you provide to improve our products and services.\n',
 style: TextStyle(height: 1.5)),
                  TextSpan(
                      text:
                          '- To send periodic emails: We may use the email address to send User information and updates pertaining to their order. It may also be used to respond to their inquiries, questions, and/or other requests. If a User decides to opt-in to our mailing list, they will receive emails that may include company news, updates, related product, or service information, etc. If at any time the User would like to unsubscribe from receiving future emails, we include detailed unsubscribe instructions at the bottom of each email.\n\n',
                      style: TextStyle(height: 1.5)),
                  TextSpan(
                      text: 'How We Protect Your Information\n',
                      style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
                  TextSpan(
                      text:
                          'We adopt appropriate data collection, storage, and processing practices and security measures to protect against unauthorized access, alteration, disclosure, or destruction of your personal information, username, password, transaction information, and data stored on our Site.\n\n',
                      style: TextStyle(height: 1.5)),
                  TextSpan(
                      text: 'Sharing Your Personal Information\n',
                      style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
                  TextSpan(
                      text:
                          'We do not sell, trade, or rent Users personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates, and advertisers for the purposes outlined above.\n\n',
                      style: TextStyle(height: 1.5)),
                  TextSpan(
                      text: 'Changes to This Privacy Policy\n',
                      style: TextStyle(fontWeight: FontWeight.bold, height: 2)),



