// userinfo.dart
import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';
import 'package:vaccilanka_mobile_application_development/pages/home.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/userinfocontroller.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/form_widgets.dart';

class UserInfoForm extends StatefulWidget {
  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final UserInfoController _userInfoController = UserInfoController(); 

 @override
  void initState() {
    super.initState();
    _userInfoController.loadUserData(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Information',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      
          backgroundColor : Color(0xFFEBF8F9),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage())),
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

    body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                buildFieldWithTitle('Child ID', _userInfoController.childIdController),
                buildFieldWithTitle('First Name', _userInfoController.firstNameController),
                buildFieldWithTitle('Last Name', _userInfoController.lastNameController),
                buildFieldWithTitle('Date of Birth', _userInfoController.dobController),
                buildFieldWithTitle('Guardian Name', _userInfoController.guardianNameController),
                buildFieldWithTitle('Address', _userInfoController.guardianAddressController),
                buildFieldWithTitle('Gender', _userInfoController.genderController),
                buildFieldWithTitle('Contact Number', _userInfoController.phoneNumberController),
                buildFieldWithTitle('Email', _userInfoController.emailController),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                      _userInfoController.updateUserInformation(); 
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
