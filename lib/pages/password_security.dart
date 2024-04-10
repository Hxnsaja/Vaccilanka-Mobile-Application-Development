import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vaccilanka_mobile_application_development/pages/services/session_manager.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';

class PasswordAndSecurity extends StatefulWidget {
  const PasswordAndSecurity({Key? key}) : super(key: key);

  @override
  _PasswordAndSecurityState createState() => _PasswordAndSecurityState();
}

class _PasswordAndSecurityState extends State<PasswordAndSecurity> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController =
      TextEditingController();
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
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("New passwords do not match")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }
    // SessionManager sessionManager = SessionManager();
    final String? userId = SessionManager().userId;
    if (userId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("User not found")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    User? user = _auth.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Not authenticated")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    String email = user.email!;
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: currentPassword);
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password successfully updated")));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred: ${e.message}")));
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Password & Security'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFEBF8F9),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildPasswordField(
                  _currentPasswordController, 'Current Password'),
              SizedBox(height: 10),
              _buildPasswordField(_newPasswordController, 'New Password'),
              SizedBox(height: 10),
              _buildPasswordField(
                  _retypeNewPasswordController, 'Re-type New Password'),
              SizedBox(height: 20),
              _isProcessing
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _changePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        child: Text('Change Password'),
                      ),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 0),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      obscureText: true,
    );
  }
}
