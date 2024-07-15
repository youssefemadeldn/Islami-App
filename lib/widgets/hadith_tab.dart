import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/models/hadithmodel.dart';
import 'package:islamic_app/views/hadith_content_view.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> allAhadith = [];
  @override
  Widget build(BuildContext context) {
    if (allAhadith.isEmpty) {
      loadHadithFile();
    }
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: -70,
          child: Image.asset(
            'assets/images/bg_removed.png',
            // height: 900,
          ),
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Image.asset('assets/images/hadith_logo.png'),
        ),
        const Positioned(
          top: 280,
          left: 0,
          right: 0,
          child: Divider(
            color: kPrimaryColor,
            thickness: 3,
          ),
        ),
        Positioned(
          top: 294,
          left: 160,
          right: 0,
          child: Text(
            'الأحاديث',
            style: GoogleFonts.elMessiri(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Positioned(
          top: 325,
          left: 0,
          right: 0,
          child: Divider(
            color: kPrimaryColor,
            thickness: 3,
          ),
        ),
        Positioned(
          top: 335,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: allAhadith.length,
              itemBuilder: (context, index) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(
                          context, HadithContentView.routName,
                          arguments: allAhadith[index]);
                    },
                    child: Text(
                      allAhadith[index].title,
                      style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  loadHadithFile() {
    rootBundle.loadString('assets/fiels/hadith_content/ahadeth.txt').then(
      (value) {
        // split ahadiths to list<hadith>
        List<String> ahadiths = value.split('#');
        // get first hadith
        for (int i = 0; i < ahadiths.length; i++) {
          String hadithOne = ahadiths[i];
          // split hadith one to lines
          List<String> hadithLines = hadithOne.trim().split('\n');
          // get hadith title
          String title = hadithLines[0];

          // remove hadith title
          hadithLines.removeAt(0);
          // after remove,  hadithLines became a content
          List<String> content = hadithLines;

          // initiate a HadithModel to store title and content of hadith
          HadithModel hadithModel = HadithModel(title, content);
          // store ahadith modles in ahdith List
          allAhadith.add(hadithModel);
          print(hadithModel.title);
        }

        setState(() {});
      },
    );
  }
}
