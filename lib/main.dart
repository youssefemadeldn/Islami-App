import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: BottomNavigationBarr.routName,
      routes: {
        BottomNavigationBarr.routName: (context) => BottomNavigationBarr(),
      },
    );
  }
}

class BottomNavigationBarr extends StatefulWidget {
  static const String routName = 'BottomNavigationBarr';

  BottomNavigationBarr({super.key});

  @override
  State<BottomNavigationBarr> createState() => _BottomNavigationBarrState();
}

class _BottomNavigationBarrState extends State<BottomNavigationBarr> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Image.asset('assets/images/bg.png'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'اسلامي',
              style: GoogleFonts.elMessiri(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          // body: Text('jjjjjjjj'),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.shifting,
              items: const [
                BottomNavigationBarItem(
                    backgroundColor: kPrimaryColor,
                    icon: ImageIcon(AssetImage('assets/images/radio.png')),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: kPrimaryColor,
                    icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: kPrimaryColor,
                    icon: ImageIcon(AssetImage('assets/images/hadith.png')),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: kPrimaryColor,
                    icon:
                        ImageIcon(AssetImage('assets/images/moshaf_blue.png')),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: kPrimaryColor,
                    icon: Icon(Icons.settings),
                    label: ''),
              ]),
        ),
      ],
    );
  }
}
