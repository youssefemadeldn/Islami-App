import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/models/hadithmodel.dart';
import 'package:islamic_app/views/bottom_navigation_bar_view.dart';

class HadithContentView extends StatelessWidget {
  static const String routName = 'HadithContentView';
  const HadithContentView({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel =
        ModalRoute.of(context)?.settings.arguments as HadithModel;
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
          body: Padding(
            padding:
                const EdgeInsets.only(top: 80, bottom: 8, right: 10, left: 10),
            child: Card(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    hadithModel.title,
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Divider(
                    color: LightAppColors.kPrimaryColor,
                    thickness: 1,
                    endIndent: 100,
                    indent: 100,
                  ),
                  Expanded(
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
