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

 Future<void> _changePassword() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    String currentPassword = _currentPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String retypeNewPassword = _retypeNewPasswordController.text.trim();

    if (newPassword != retypeNewPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("New passwords do not match")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }
