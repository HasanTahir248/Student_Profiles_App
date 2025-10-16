import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_model.dart';

final homeProvider = FutureProvider<List<Home>>((ref) async {
  final String response = await rootBundle.loadString('assests/home.json');
  final data = jsonDecode(response) as List<dynamic>;
  return data.map((json) => Home.fromJson(json)).toList();
});