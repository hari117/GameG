import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:google_fonts/google_fonts.dart';

class GameRatings extends StatelessWidget {
  fignaTheams fg = fignaTheams();
  Game game;

  GameRatings(this.game);

  List svgImages = ["Assets/interfaceicons/Fav_Icon.svg", "Assets/interfaceicons/Like_Icon.svg", "Assets/interfaceicons/Dislike_Icon.svg"];

  @override
  Widget build(BuildContext context) {

    Widget exceptional;
    Widget likes;
    Widget dislikes;





    List<Widget> newRating = List();
    int len = game.ratingDistribution.length;
    for (int i = 0; i < svgImages.length; i++) {
      if (i < len)
        newRating.add(
          newGameRating(svgImages[i], game.ratingDistribution[i].count),
        );
      else
        newRating.add(
          newGameRating(svgImages[i], 0),
        );
    }

    return Row(
      children: newRating,
    );
    // return buildExceptional(game);
  }

  Widget buildExceptional(Game game) {
    return Row(
      children: <Widget>[
        SvgPicture.asset("${svgImages[0]}"),
        bodyText_01("{game.ratingDistribution[0].count}")

      ],
    );
  }

  bodyText_01(String name) {
    return Text(
      name,
      style: GoogleFonts.roboto(color: fg.onSurfaceColor_03, fontSize: fg.bodyText_01,),
    );
  }
  Widget buildLikes() {}

  Widget buildDislikes() {}

  newGameRating(String svgimage, int count) {
    return Row(
      children: <Widget>[
        SvgPicture.asset("$svgimage"),
        SizedBox(
          width: 10,
        ),
        Text(
          "$count",
          style: GoogleFonts.roboto(color: fg.onSurfaceColor_03),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
