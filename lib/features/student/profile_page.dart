import 'package:flutter/material.dart';
import 'package:student_profiles/features/student/student_provider.dart';
// import '../../viewmodels/student_vm/student_viewmodel.dart';
import 'student_model.dart';
// import 'package:provider/provider.dart';
import '../../widgets/appbar.dart';
// import '../../viewmodels/home_vm/home_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home/home_provider.dart';



class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final List<Student> students = ref.watch(studentProvider);
    final homeData = ref.watch(homeProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(title: "Student Profiles"),
    body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ Color(0xFF6A1B9A), Color(0xFF8E24AA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(

        child: Column(
          children: [
            if (students.isEmpty)
              const Expanded(
                child: Center(child: CircularProgressIndicator(color: Colors.white)),
              )
            else
              Expanded(
                child: _buildStudentList(students),
              ),
            
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              homeData.when(data: (data) => data.first.ending, error: (err, stack)=> 'Error', loading: () => ''),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ),
          ],
        ), 
      ),
      ),
    );
  }
  Widget _buildStudentList(List<Student> students){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple.shade200,
              child: Text(
                student.name[0],
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            title: Text(
              student.name,
              style:  const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Age: ${student.age} • Course: ${student.course}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    ),
                  ),
                const SizedBox(height: 4),
                Text(
                  student.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  } 
}
