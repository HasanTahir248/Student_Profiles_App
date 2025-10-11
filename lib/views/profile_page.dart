import 'package:flutter/material.dart';
import '../viewmodels/student_viewmodel.dart';
import '../models/student_model.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Consumer<StudentViewmodel>(
      builder: (context, viewModel, child){
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Student Profiles'),
            centerTitle: false,
            backgroundColor: Colors.deepPurple,
            titleTextStyle: const TextStyle(
              color: Colors.white,
            ),
            shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Container(
         width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xFF6A1B9A), Color(0xFF8E24AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            ),
          ),
          child: viewModel.students.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _buildStudentList(viewModel.students),
          ),
        );
      },
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
