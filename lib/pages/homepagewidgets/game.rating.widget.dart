

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawg/models/generated/page.json.model.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:enum_to_string/enum_to_string.dart';

class GameRatings extends StatelessWidget {
  Game game;
  Map<GameRatingDistributionTitle, Color> colorMap = Map();

  GameRatings(this.game) {
    colorMap.putIfAbsent(GameRatingDistributionTitle.EXCEPTIONAL, () => Colors.green);
    colorMap.putIfAbsent(GameRatingDistributionTitle.MEH, () => Colors.red);
    colorMap.putIfAbsent(GameRatingDistributionTitle.RECOMMENDED, () => Colors.orange);
    colorMap.putIfAbsent(GameRatingDistributionTitle.SKIP, () => Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = List();

    for (GameRatingDistribution distribution in game.ratingDistribution) {
      list.add(gameRatingDistributionFor(distribution));
    }

    return ListView.builder(
      shrinkWrap:true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int pos) {
        return list[pos];
      },
    );
  }

  /**
   * return a widget for single box
   * which contains color circle, title count
   */
  gameRatingDistributionFor(GameRatingDistribution distribution) {
    // lockup color from map;
    // if color not found assume a default color

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          ratingsColorCircle(colorMap[distribution.title]),
          SizedBox(
            width: 8,
          ),
          ratingsText(
              "${EnumToString.parse(distribution.title)}", distribution.count, colorMap[distribution.title])
        ],
      ),
    );
  }

  ratingsText(String name, int index, Color color) {
    return Text(
      "$name : $index ",
      style: GoogleFonts.roboto(color: color, fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1),
    );
  }

  ratingsColorCircle(Color color) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
