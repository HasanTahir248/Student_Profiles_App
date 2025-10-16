import 'package:flutter/material.dart';
import 'package:student_profiles/features/student/profile_page.dart';
// import '../../viewmodels/home_vm/home_viewmodel.dart';
import '../../widgets/button.dart';
// import 'package:provider/provider.dart';
import '../../widgets/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_provider.dart';


class HomePage extends ConsumerWidget{
  const HomePage({super.key});

 @override
 Widget build(BuildContext context, WidgetRef ref){
  final homeDataAsync = ref.watch(homeProvider);
  return Scaffold(
    extendBodyBehindAppBar: true,
    backgroundColor: Colors.transparent,

    body: homeDataAsync.when(
      error: (err, Stack) => Center(child: Text('Error, $err')), 
      loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
      data: (homeDataAsync) {
        final homeData = homeDataAsync.first;
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(title: homeData.title),
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
      }
      )
  );
 }
}




//   return Consumer<HomeViewmodel>(
//     builder: (context, viewModel, child){
//       if(viewModel.homeList.isEmpty){
//         return Scaffold(
//           backgroundColor: Color(0xFF6A1B9A),
//           body: Center(
//             child: CircularProgressIndicator(color: Colors.white),
//           ),
//         );
//       }
//       final homeData = viewModel.homeList.first;

//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         backgroundColor: Colors.transparent,
//         appBar: CustomAppBar(title: homeData.title),
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [ Color(0xFF6A1B9A), Color(0xFF8E24AA)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const SizedBox(height: 30),
//               Icon(
//                 Icons.school,
//                 size: 100,
//                 color: Colors.white,
//               ),
//               Padding(
//                 padding:  const EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   homeData.description,
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40),
//                 child: CustomButton(
//                   text: 'View Profiles', 
//                   onPressed: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ProfilePage())
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: Text(
//                   homeData.ending,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                   ),
//                 )
//               ),
//             ],
//           ),
//         ),
//       ),
//       );
//     },
//   );
//  }
// }