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
        
         
