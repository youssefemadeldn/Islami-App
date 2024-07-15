import 'package:flutter/material.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/views/bottom_navigation_bar_view.dart';
import 'package:islamic_app/views/hadith_content_view.dart';
import 'package:islamic_app/views/quran_content_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // scaffoldBackgroundColor: kPrimaryColor,
          ),
      debugShowCheckedModeBanner: false,
      initialRoute: BottomNavigationBarView.routName,
      routes: {
        BottomNavigationBarView.routName: (context) =>
            BottomNavigationBarView(),
        HadithContentView.routName: (context) => HadithContentView(),
        QuranContentView.routName: (context) => QuranContentView(),
      },
    );
  }
}
