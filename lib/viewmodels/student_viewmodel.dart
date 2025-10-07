import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/student_model.dart';

class StudentViewmodel {
  List<Student> _students = [];

  List<Student> get students => _students;
  
  Future<void> loadstudents() async {
    final String response = await rootBundle.loadString('assests/data.json');
    final data = jsonDecode(response) as List<dynamic>;
    _students = data.map((json) => Student.fromJson(json)).toList();
  } 
  int get totalStudents => _students.length;
}
