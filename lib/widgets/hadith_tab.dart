import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/views/hadith_content_view.dart';

class HadithTab extends StatelessWidget {
  List<Widget> generateTextWidgets() {
    return List.generate(50, (index) {
      return Center(
        child: Text(
          'الحديث رقم ${index + 1}',
          style: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    });
  }

  HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/hadith_logo.png'),
        const Divider(
          color: kPrimaryColor,
          thickness: 3,
        ),
        Text(
          'الأحاديث',
          style: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Divider(
          color: kPrimaryColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView(
            children: List.generate(50, (index) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(
                        context, HadithContentView.routName);
                  },
                  child: Text(
                    'الحديث رقم ${index + 1}',
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
