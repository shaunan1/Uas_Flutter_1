import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Apaan',
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {'name': 'Ignasius Yoga Puji', 'nim': 'F12202200057', 'gpa': 3.9, 'image': 'assets/student1.png','kel':'Laki-laki','sam':'Peserta didik baru','pgt':'Universitas Dian Nuswantoro','tm':'15 September 2022','jps':'Sarjana - Sistem Informasi (Kampus Kota Kediri)','st':'Tidur'},
    {'name': 'Dian Restu Adji', 'nim': 'F12202200056', 'gpa': 3.99, 'image': 'assets/student2.png','kel':'Laki-laki','sam':'Peserta didik baru','pgt':'Universitas Dian Nuswantoro','tm':'15 September 2022','jps':'Sarjana - Sistem Informasi (Kampus Kota Kediri)','st':'Mengantuk'},
    {'name': 'Mukhammad Shaunan', 'nim': 'F12202200070', 'gpa': 4.3, 'image': 'assets/student3.png','kel':'Laki-laki','sam':'Peserta didik baru','pgt':'Universitas Dian Nuswantoro','tm':'15 September 2022','jps':'Sarjana - Sistem Informasi (Kampus Kota Kediri)','st':'Baru Bangun'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Apaan'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Daftar Mahasiswa',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ...students.map((student) => Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Image.asset(student['image'], width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(student['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(student['nim']),
                            Text('IPK: ${student['gpa']}'),
                            Text('Status: ${student['st']}'),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentDetailScreen(student: student),
                            ),
                          );
                        },
                      ),
                    )),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Print'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentDetailScreen extends StatelessWidget {
  final Map<String, dynamic> student;

  StudentDetailScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(student['image'], width: 100, height: 100, fit: BoxFit.cover),
            ),
            SizedBox(height: 16),
            Text(
              'Nama: ${student['name']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'NIM: ${student['nim']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'IPK: ${student['gpa']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Kelamin: ${student['kel']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Status Awal Mahasiswa: ${student['sam']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Perguruan Tinggi: ${student['pgt']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Tanggal Masuk: ${student['tm']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Jenjang - Program Studi: ${student['jps']}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

