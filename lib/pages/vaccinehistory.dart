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
  String? uid; // Changed from 'late' to nullable
  late Future<List<VaccinationRecord>> vaccinationRecords;

  @override
  void initState() {
    super.initState();
    initVaccineHistory();
  }

  void initVaccineHistory() {
    SessionManager sessionManager = SessionManager();
    uid = sessionManager.userId; // Ensuring uid is nullable to handle the case where it may not be set

    if (uid == null) {
      debugPrint('Error: User ID is null, ensure the user is logged in.');
      // Navigate the user to the login page or show an error
    } else {
      debugPrint('User ID: $uid');
      vaccinationRecords = getVaccinationRecords(uid!);
    }
  }

  Future<List<VaccinationRecord>> getVaccinationRecords(String uid) async {
    try {
      var vaccineInfoSnapshot = await _firestore
          .collection('vaccine_info')
          .where('uid', isEqualTo: uid)
          .get();
      debugPrint('Found ${vaccineInfoSnapshot.docs.length} vaccination records for User ID: $uid');

      List<VaccinationRecord> records = [];
      for (var vaccineInfoDoc in vaccineInfoSnapshot.docs) {
        var data = vaccineInfoDoc.data();
        var hospitalSnapshot = await _firestore
            .collection('hospital')
            .where('hospital_id', isEqualTo: data['hospital_id'])
            .limit(1)
            .get();
        var hospitalName = hospitalSnapshot.docs.first.data()['name'];

        var vaccineSnapshot = await _firestore
            .collection('vaccine')
            .where('vaccine_id', isEqualTo: data['vaccine_id'])
            .limit(1)
            .get();
        var vaccineName = vaccineSnapshot.docs.first.data()['name'];

        records.add(
          VaccinationRecord(
            date: data['date'],
            hospitalName: hospitalName,
            vaccineName: vaccineName,
          ),
        );
      }
      return records;
    } catch (e) {
      debugPrint('Error retrieving vaccination records: $e');
      throw 'Error retrieving vaccination records';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination History'),
      ),
      body: FutureBuilder<List<VaccinationRecord>>(
        future: vaccinationRecords,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Make the DataTable scrollable horizontally
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Hospital Name')),
                  DataColumn(label: Text('Vaccine Name')),
                ],
                rows: snapshot.data!
                    .map(
                      (record) => DataRow(cells: [
                    DataCell(Text(record.date)),
                    DataCell(Text(record.hospitalName)),
                    DataCell(Text(record.vaccineName)),
                  ]),
                )
                    .toList(),
              ),
            );
          } else {
            return Text('No records found.');
          }
        },
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 0),
    );
  }
}

class VaccinationRecord {
  final String date;
  final String hospitalName;
  final String vaccineName;

  VaccinationRecord({
    required this.date,
    required this.hospitalName,
    required this.vaccineName,
  });
}
