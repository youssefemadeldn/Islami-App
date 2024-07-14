import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:islamic_app/views/bottom_navigation_bar_view.dart';

class QuranContentView extends StatefulWidget {
  static const String routName = 'QuranContentView';
  const QuranContentView({super.key});

  @override
  State<QuranContentView> createState() => _QuranContentViewState();
}

class _QuranContentViewState extends State<QuranContentView> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      loadSuraFile(modelIndex: suraModel.suraIndex);
    }
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
            automaticallyImplyLeading: true,
            leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, BottomNavigationBarView.routName);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                weight: 5,
              ),
            ),
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
          body: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سورة ${suraModel.suraName}',
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.play_circle)),
                ],
              ),
              const Divider(
                color: kPrimaryColor,
                thickness: 1,
                endIndent: 100,
                indent: 100,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 15, bottom: 15),
                        child: Center(
                          child: Text(
                            verses[index],
                            style: GoogleFonts.inter(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  loadSuraFile({required int modelIndex}) async {
    // load sura file
    String allSura = await rootBundle
        .loadString('assets/fiels/quran_content/${modelIndex + 1}.txt');
    // split sura to lines
    List<String> suraLines = allSura.split('\n');
// assign suraLines to another list that is global in whole class
// because suraLines is seen only in its function
    verses = suraLines;
    // rebuild Ui
    setState(() {});
  }
}
