import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/models/hadithmodel.dart';

class HadithContentView extends StatelessWidget {
  static const String routName = 'HadithContentView';
  const HadithContentView({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel =
        ModalRoute.of(context)?.settings.arguments as HadithModel;
    return Stack(
      children: [
        Scaffold(
          // backgroundColor: Colors.transparent,
          body: Padding(
            padding:
                const EdgeInsets.only(top: 80, bottom: 8, right: 10, left: 10),
            child: Card(
              // clipBehavior: Clip.none,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -100,
                    left: 0,
                    right: 0,
                    child: Image.asset('assets/images/bg_removed.png'),
                  ),
                  Positioned(
                    top: 65,
                    left: 120,
                    right: 0,
                    child: Text(
                      hadithModel.title,
                      style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Divider(
                      color: LightAppColors.kPrimaryColor,
                      thickness: 1,
                      endIndent: 80,
                      indent: 80,
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 475,
                      child: ListView.builder(
                          itemCount: hadithModel.content.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 30),
                              child: Center(
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  hadithModel.content[index],
                                  style: GoogleFonts.inter(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
