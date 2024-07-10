import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/views/bottom_navigation_bar_view.dart';

class HadithContentView extends StatelessWidget {
  static const String routName = 'HadithContentView';
  const HadithContentView({super.key});

  @override
  Widget build(BuildContext context) {
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'الحديث الأول',
                  style: GoogleFonts.inter(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Divider(
                  color: kPrimaryColor,
                  thickness: 1,
                  endIndent: 100,
                  indent: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Center(
                    child: Text(
                      """
 عن أمـيـر المؤمنـين أبي حـفص عمر بن الخطاب رضي الله عنه ، قال : سمعت رسول الله صلى الله عـليه وسلم يـقـول : ( إنـما الأعـمـال بالنيات وإنـمـا لكـل امـرئ ما نـوى . فمن كـانت هجرته إلى الله ورسولـه فهجرتـه إلى الله ورسـوله ومن كانت هجرته لـدنيا يصـيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه ).
رواه إمام المحد ثين أبـو عـبـد الله محمد بن إسماعـيل بن ابراهـيـم بن المغـيره بن بـرد زبه البخاري الجعـفي،[رقم:1] وابـو الحسـيـن مسلم بن الحجاج بن مـسلم القـشـيري الـنيسـابـوري [رقم :1907] رضي الله عنهما في صحيحيهما اللذين هما أصح الكتب المصنفه. 
""",
                      style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
