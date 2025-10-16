import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'student_model.dart';

class StudentNotifier extends StateNotifier<List<Student>>{
  StudentNotifier() : super([]);

  Future<void> loadstudents() async {
    final String response = await rootBundle.loadString('assests/data.json');
    final data = jsonDecode(response) as List<dynamic>;

    state = data.map((json) => Student.fromJson(json)).toList();
  }
}

final studentProvider = StateNotifierProvider<StudentNotifier, List<Student>>((ref){
  return StudentNotifier()..loadstudents();
});