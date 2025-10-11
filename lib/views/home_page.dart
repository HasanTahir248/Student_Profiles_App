import 'package:flutter/material.dart';
import 'package:student_profiles/views/profile.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context){
  return Consumer<HomeViewmodel>(
    builder: (context, viewModel, child){
      if(viewModel.homeList.isEmpty){
        return Scaffold(
          backgroundColor: Color(0xFF6A1B9A),
          body: Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        );
      }
      final homeData = viewModel.homeList.first;

      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text( homeData.title ),
          centerTitle: false,
          backgroundColor: Colors.deepPurple,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20)
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30),
              Icon(
                Icons.school,
                size: 100,
                color: Colors.white,
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  homeData.description,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomButton(
                  text: 'View Profiles', 
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage())
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  homeData.ending,
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
    },
  );
 }
}