import 'package:flutter/material.dart';
import 'screens/student_list.dart';

void main() => runApp(const StudentManagerApp());

class StudentManagerApp extends StatelessWidget {
  const StudentManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StudentListScreen(),
    );
  }
}