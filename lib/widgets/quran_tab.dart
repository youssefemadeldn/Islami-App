import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/quran_logo.png'),
        const Divider(
          color: kPrimaryColor,
          thickness: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'عدد الآيات',
              style: GoogleFonts.elMessiri(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'اسم السورة',
              style: GoogleFonts.elMessiri(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Divider(
          color: kPrimaryColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView(
            children: List.generate(114, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '286',
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'البقرة',
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
