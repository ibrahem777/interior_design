import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';
import 'package:interior_design_app/src/views/screens/bottom_navigation/bottom_navigation_screen.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: fPrimaryColor,
        primaryColor: fPrimaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
      home: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,

        // rebuildFactor: (MediaQueryData old, MediaQueryData data){
        //   return false ;
        // },
        builder: (child,context) {
          return  BottomNavigationScreen();
        },),



    );
  }
}


