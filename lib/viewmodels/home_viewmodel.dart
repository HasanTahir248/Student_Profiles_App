import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/home_model.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  List<Home> _home = [];

  List<Home> get homeList => _home;

  Future<void> loadHomeData() async {
    final String response = await rootBundle.loadString('assests/home.json');
    final data = jsonDecode(response) as List<dynamic>;
    _home = data.map((json) => Home.fromJson(json)).toList();

    notifyListeners();
  }

}