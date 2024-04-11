import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaccilanka_mobile_application_development/pages/services/session_manager.dart';

class UserInfoController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final SessionManager _sessionManager;
  late final TextEditingController childIdController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController dobController;
  late final TextEditingController guardianNameController;
  late final TextEditingController guardianAddressController;
  late final TextEditingController genderController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController emailController;

  UserInfoController() {
    _sessionManager = SessionManager();
    childIdController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    dobController = TextEditingController();
    guardianNameController = TextEditingController();
    guardianAddressController = TextEditingController();
    genderController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
  }

  Future<void> loadUserData() async {
    String uid = _sessionManager.getUserId();
    QuerySnapshot userSnapshot = await _firestore
        .collection('child')
        .where('uid', isEqualTo: uid)
        .get();
    
    if (userSnapshot.docs.isNotEmpty) {
      Map<String, dynamic> userData = userSnapshot.docs.first.data() as Map<String, dynamic>;
      
      childIdController.text = userData['child_id'] ?? '';
      firstNameController.text = userData['firstname'] ?? '';
      lastNameController.text = userData['lastname'] ?? ''; 
      dobController.text = userData['dob'] ?? '';
      guardianNameController.text = userData['guardian_name'] ?? ''; 
      guardianAddressController.text = userData['guardian_address'] ?? '';
      genderController.text = userData['gender'] ?? '';
      phoneNumberController.text = userData['phone_number'] ?? '';
      emailController.text = userData['email'] ?? '';
    }
  }

  Future<void> updateUserInformation() async {
    String uid = _sessionManager.getUserId();
    DocumentReference userDoc = _firestore
        .collection('child')
        .where('uid', isEqualTo: uid)
        .get()
        .then((snapshot) => snapshot.docs.first.reference); 

    return await userDoc.update({
      'child_id': childIdController.text,
      'firstname': firstNameController.text,
      'lastname': lastNameController.text, 
      'dob': dobController.text,
      'guardian_name': guardianNameController.text,
      'guardian_address': guardianAddressController.text,
      'gender': genderController.text,
      'phone_number': phoneNumberController.text,
      'email': emailController.text,
    });
  }
}