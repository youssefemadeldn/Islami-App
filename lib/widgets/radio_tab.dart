import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        Image.asset(
          'assets/images/radio_logo.png',
          // height: 400,
        ),
        Spacer(
          flex: 1,
        ),
        Text(
          'إذاعة القرآن الكريم',
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                color: kPrimaryColor,
                Icons.arrow_back_ios,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                color: kPrimaryColor,
                Icons.play_arrow,
                size: 50,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  size: 40,
                  color: kPrimaryColor,
                  Icons.arrow_forward_ios,
                )),
          ],
        ),
        Spacer(
          flex: 2,
        )
      ],
    );
  }
}
