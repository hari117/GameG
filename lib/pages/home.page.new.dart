import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageNew extends StatefulWidget {
  @override
  _HomePageNewState createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  FigmaColors figmaColors = FigmaColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GAMEG",
          style: GoogleFonts.roboto(
              fontSize: 20, color: figmaColors.onSurfaceColor_01),
        ),
        backgroundColor: Color.fromRGBO(46, 49, 52, 1),
        elevation: 4,
        bottomOpacity: 15.0,
      ),
      backgroundColor: figmaColors.surfaceColor,
      body: Column(
        children: <Widget>[
          Container(
            height: 152,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Type something here",
                    helperStyle: TextStyle(color: figmaColors.onSurfaceColor_03,fontSize: 16,height: 124.7),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
