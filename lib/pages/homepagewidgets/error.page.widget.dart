import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/helperfiles/svg.imges.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatelessWidget {
  HomePageState homeState = HomePageState.homePageState;
  FigmaColors figmaColors = FigmaColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: figmaColors.surfaceColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset("Assets/erroricons/Robo_Icon.svg"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Some thing went wrong",
                style: GoogleFonts.roboto(color: figmaColors.primaryColor, fontSize: figmaColors.H5),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sorry, something went wrong there. Please check your internet connection and reload again",
                style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03, height: 1.2),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              MaterialButton(
                elevation: 2,
                height: 33,
                minWidth: 67,
                textColor: figmaColors.elevation_01,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: figmaColors.primaryColor,
                child: Text(
                  "Reload",
                  style: TextStyle(fontSize: figmaColors.bodyText_02),
                ),
                onPressed: () {
                  homeState.resetState();
                  homeState.loadNextPage();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
