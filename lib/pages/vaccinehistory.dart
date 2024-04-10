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

    for (var vaccineInfoDoc in vaccineInfoSnapshot.docs) {
      var data = vaccineInfoDoc.data();

      // Retrieve the hospital name
      var hospitalSnapshot = await _firestore
          .collection('hospital')
          .where('hospital_id', isEqualTo: data['hospital_id'])
          .limit(1)
          .get();
      var hospitalName = hospitalSnapshot.docs.first.data()['name'];

      // Retrieve the vaccine name
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
