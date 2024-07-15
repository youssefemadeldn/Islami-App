import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
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
          top: 150,
          child: Image.asset(
            'assets/images/radio_logo.png',
            // height: 400,
          ),
        ),
        Positioned(
          top: 420,
          left: 0,
          right: 0,
          child: Text(
            textAlign: TextAlign.center,
            'إذاعة القرآن الكريم',
            style: GoogleFonts.elMessiri(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
        ),
        Positioned(
          top: 500,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  // color: ,
                  Icons.arrow_back_ios,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  // color: LightAppColors.kPrimaryColor,
                  Icons.play_arrow,
                  size: 50,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    size: 40,
                    // color: LightAppColors.kPrimaryColor,
                    Icons.arrow_forward_ios,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
