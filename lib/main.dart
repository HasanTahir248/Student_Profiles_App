import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'package:provider/provider.dart';
import 'viewmodels/student_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentViewmodel()..loadstudents(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profiles',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: HomePage(),
    );
  }
}




