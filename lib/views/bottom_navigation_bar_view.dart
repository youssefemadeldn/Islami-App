import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/widgets/hadith_tab.dart';
import 'package:islamic_app/widgets/quran_tab.dart';
import 'package:islamic_app/widgets/radio_tab.dart';
import 'package:islamic_app/widgets/sebha_tab.dart';
import 'package:islamic_app/widgets/setting_tab.dart';

class BottomNavigationBarView extends StatefulWidget {
  static const String routName = 'BottomNavigationBarr';

  BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
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
          body: taps[selectedIndex],
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

  List<Widget> taps = [
    const RadioTab(),
    SebhaTab(),
    HadithTab(),
    QuranTab(),
    const SettingTab(),
  ];
}
