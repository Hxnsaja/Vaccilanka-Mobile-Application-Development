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
