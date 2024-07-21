import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/generated/l10n.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotationAngle = 0.0;
  int tasbhaNumber = 0;
  List<String> tasabeh = [
    'سبحان الله',
    'الحمدالله',
    'لا اله الا الله',
    'الله اكبر'
  ];

  int indexTsabeh = 0;

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
          top: 50,
          left: 0,
          right: 0,
          child: Text(
            S.of(context).islami,
            textAlign: TextAlign.center,
            style: GoogleFonts.elMessiri(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
        ),
        Positioned(
          left: 184,
          top: 75,
          child: Image.asset(
            // head of sebha
            'assets/images/head_of_seb7a.png',
            color: Theme.of(context).colorScheme.secondary,
            width: 73,
            height: 80,
          ),
        ),
        Positioned(
          top: 135,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              rotationAngle = rotationAngle + 0.25;
              tasbhaNumber += 1;
              if (tasbhaNumber == 33) {
                tasbhaNumber = 1;
                indexTsabeh++;
                if (indexTsabeh == 4) {
                  indexTsabeh = 0;
                }
              }
              setState(() {});
            },
            child: Transform.rotate(
              angle: rotationAngle,
              child: Image.asset(
                // sebha body
                'assets/images/body_of_seb7a.png',
                color: Theme.of(context).colorScheme.secondary,
                width: 234,
                height: 180,
              ),
            ),
          ),
        ),
        Positioned(
          top: 330,
          right: 0,
          left: 0,
          child: Text(
            S.of(context).number_of_praises,
            textAlign: TextAlign.center,
            style: GoogleFonts.elMessiri(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          top: 380,
          left: 169,
          child: Container(
            width: 69,
            height: 81,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.57),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '$tasbhaNumber',
                style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 490,
          left: 137,
          child: Container(
            width: 137,
            height: 51,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '${tasabeh[indexTsabeh]}',
                style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
