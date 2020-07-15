import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:google_fonts/google_fonts.dart';

class GameGAppBar extends StatelessWidget  with PreferredSizeWidget{
  HomePageState homeState = HomePageState.homePageState;
  FigmaColors figmaColors = FigmaColors();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
     return AppBar(
      backgroundColor: Color.fromRGBO(46, 49, 52, 1),
      elevation: 4,
      bottomOpacity: 15.0,
      title: InkWell(
        onTap: () {
          homeState.resetState();
          homeState.loadNextPage();
        },
        child: Text(
          "GAMEG",
          style: GoogleFonts.roboto(fontSize: 20, color: figmaColors.onSurfaceColor_01),
        ),
      ),
      //  centerTitle: false,
    );
  }
}
