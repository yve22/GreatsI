import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student.dart';

class StudentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add new student
  Future<void> addStudent(Student student) async {
    await _firestore.collection('students').add(student.toMap());
  }

  // Get all students (realtime updates)
  Stream<List<Student>> getStudents() {
    return _firestore.collection('students').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Student.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Update student
  Future<void> updateStudent(Student student) async {
    await _firestore.collection('students').doc(student.id).update(student.toMap());
  }

  // Delete student
  Future<void> deleteStudent(String studentId) async {
    await _firestore.collection('students').doc(studentId).delete();
  }
}