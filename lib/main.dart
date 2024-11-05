import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi SiUdin',
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {'name': 'Ignasius Yoga Puji', 'nim': 'F12202200057', 'gpa': 3.9, 'image': 'assets/student1.png'},
    {'name': 'Dian Restu Adji', 'nim': 'F12202200056', 'gpa': 3.99, 'image': 'assets/student2.png'},
    {'name': 'Mukhammad Shaunan', 'nim': 'F12202200070', 'gpa': 4.3, 'image': 'assets/student3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi SiUdin'),
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
                          ],
                        ),
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
