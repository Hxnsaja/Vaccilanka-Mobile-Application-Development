import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaccilanka_mobile_application_development/pages/widgets/bottomnav.dart';
import 'package:vaccilanka_mobile_application_development/pages/services/session_manager.dart';

class VaccineHistoryPage extends StatefulWidget {
  const VaccineHistoryPage({Key? key}) : super(key: key);

  @override
  _VaccineHistoryPageState createState() => _VaccineHistoryPageState();
}

class _VaccineHistoryPageState extends State<VaccineHistoryPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String uid;
  late Future<List<VaccinationRecord>> vaccinationRecords;

  @override
  void initState() {
    super.initState();
    uid = SessionManager().getUserId();
    vaccinationRecords = getVaccinationRecords();
  }

  Future<List<VaccinationRecord>> getVaccinationRecords() async {
    var vaccineInfoSnapshot = await _firestore
        .collection('vaccine_info')
        .where('uid', isEqualTo: uid)
        .get();

    List<VaccinationRecord> records = [];
