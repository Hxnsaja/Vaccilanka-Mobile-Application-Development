import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';

class PasswordAndSecurity extends StatefulWidget {
  const PasswordAndSecurity({Key? key}) : super(key: key);

  @override
  _PasswordAndSecurityState createState() => _PasswordAndSecurityState();
}

class _PasswordAndSecurityState extends State<PasswordAndSecurity> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isProcessing = false;
