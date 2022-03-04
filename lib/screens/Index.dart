// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:islamk/widgets/SurahListBuilder.dart';
import 'package:islamk/models/Surah.dart';
import 'dart:convert';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  /// Used for Bottom Navigation
  // int _selectedIndex = 0;

  /// Get Screen Brightness
  // void getScreenBrightness() async {
  //   globals.brightnessLevel = await Screen.brightness;
  // }

  /// Navigation event handler
  // _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //
  //   /// Go to Bookmarked page
  //   if (index == 0) {
  //     setState(() {
  //       /// in case Bookmarked page is null (Bookmarked page initialized in splash screen)
  //       if (globals.bookmarkedPage == null) {
  //         globals.bookmarkedPage = globals.DEFAULT_BOOKMARKED_PAGE;
  //       }
  //     });
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //             widgets: (context) =>
  //                 SurahViewBuilder(pages: globals.bookmarkedPage - 1)),
  //         (Route<dynamic> route) => false);
  //
  //     /// Continue reading
  //   } else if (index == 1) {
  //     if (globals.lastViewedPage != null) {
  //       /// Push to Quran view ([int pages] represent surah page(reversed index))
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               widgets: (context) =>
  //                   SurahViewBuilder(pages: globals.lastViewedPage - 1)));
  //     }
  //
  //     /// Customize Screen Brightness
  //   } else if (index == 2) {
  //     if (globals.brightnessLevel == null) {
  //       getScreenBrightness();
  //     }
  //     showDialog(context: this.context, widgets: (context) => SliderAlert());
  //   }
  // }

  // void redirectToLastVisitedSurahView() {
  //   print("redirectTo:${globals.lastViewedPage}");
  //   if (globals.lastViewedPage != null) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //             widgets: (context) =>
  //                 SurahViewBuilder(pages: globals.lastViewedPage)),
  //         (Route<dynamic> route) => false);
  //   }
  // }

  @override
  void initState() {
    /// set saved Brightness level
    // Screen.setBrightness(globals.brightnessLevel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#3a8695'),
        elevation: 0,
        /*leading: IconButton(
            icon: Icon(
              Icons.tune,
              color: Colors.white,
            ),
            onPressed: (){
              showDialog(context: this.context,
                  widgets:(context)=>SliderAlert());
            },
          ),*/
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                padding: const EdgeInsets.all(3.0),
                child: Text('القرأن الكريم')),
            // Icon(
            //   Icons.format_list_numbered_rtl,
            //   color: Colors.white,
            // ),
            SizedBox(
              child: Image.asset('assets/images/qua.png'),
              width: 35,
              height: 35,
            ),
          ],
        ),
      ),
      body: Container(
        child: Directionality(
          textDirection: TextDirection.rtl,

          /// Use future widgets and DefaultAssetBundle to load the local JSON file
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/json/surah.json'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Surah> surahList = parseJson(snapshot.data.toString());
                  return surahList.isNotEmpty
                      ? new SurahListBuilder(surah: surahList)
                      : new Center(child: new CircularProgressIndicator());
                } else {
                  return new Center(child: new CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  List<Surah> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Surah>((json) => new Surah.fromJson(json)).toList();
  }
}
