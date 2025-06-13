import 'package:coffeeshop_application/screens/home.dart';
import 'package:coffeeshop_application/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Match this to your Figma/Design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coffee Shop',
          theme: ThemeData(
            fontFamily: 'Sora', // Optional, depending on your setup
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const Welcome(), // <-- replace with your actual home widget
    );
  }
}
