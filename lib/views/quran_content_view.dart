import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/constants.dart';
import 'package:islamic_app/models/sura_model.dart';

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
        Scaffold(
          // backgroundColor: Colors.transparent,
          body: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 80, bottom: 10),
            child: Card(
              // clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.all(8),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  Positioned(
                    bottom: -50,
                    left: 20,
                    child: Image.asset('assets/images/bg_removed.png'),
                  ),
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'سورة ${suraModel.suraName}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.play_circle)),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Divider(
                      color: LightAppColors.kPrimaryColor,
                      thickness: 1,
                      endIndent: 100,
                      indent: 100,
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 475,
                      child: ListView.builder(
                          itemCount: verses.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 15, bottom: 15),
                              child: Center(
                                child: Text(
                                  verses[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
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
