import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/models/generated/page.json.model.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:enum_to_string/enum_to_string.dart';

class GameRatings extends StatelessWidget {
  FigmaColors figmaColors = FigmaColors();
  Game game;

  GameRatings(this.game);

  List svgImages = [
    "Assets/interfaceicons/Fav_Icon.svg",
    "Assets/interfaceicons/Like_Icon.svg",
    "Assets/interfaceicons/Dislike_Icon.svg"
  ];

  @override
  Widget build(BuildContext context) {

    List<Widget> newRating = List();
    for (int i = 0; i < svgImages.length; i++) {
      newRating.add(newGameRating(svgImages[i], game.ratingDistribution[i].count));

    }

    return Row(
      children: newRating,
    );
  // return buildExceptional(game);

  }

  Widget buildExceptional(Game game){

    return Row(
      children: <Widget>[
        SvgPicture.asset("${svgImages[0]}"),
        Text("${game.ratingDistribution[0].count}",
          style: GoogleFonts.roboto(
              color: figmaColors.onSurfaceColor_03, fontSize: 16, height: 127),
        )
      ],
    );
  }

  Widget buildLikes(){

  }

  Widget buildDislikes(){

  }

  newGameRating(String svgimage, int count) {

    return Row(
      children: <Widget>[

        SvgPicture.asset("$svgimage"),
        SizedBox(
          width: 10,
        ),
        Text("$count",style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03),),

        SizedBox(
          width: 20,
        ),

      ],
    );
  }
}
