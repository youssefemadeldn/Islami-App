import 'package:flutter/material.dart';
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
          child: Image.asset('assets/images/bg_removed.png'),
        ),
        Scaffold(
          // backgroundColor: Colors.transparent,

          body: taps[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon:
                        const ImageIcon(AssetImage('assets/images/radio.png')),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: const ImageIcon(
                        AssetImage('assets/images/sebha_blue.png')),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon:
                        const ImageIcon(AssetImage('assets/images/hadith.png')),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: const ImageIcon(
                        AssetImage('assets/images/moshaf_blue.png')),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: const Icon(Icons.settings),
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
