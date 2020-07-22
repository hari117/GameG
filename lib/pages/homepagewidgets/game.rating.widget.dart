import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';

class GameRatings extends StatelessWidget {
  Game game;

  GameRatings(this.game);

  final exceptionalIcon = "Assets/interfaceicons/Fav_Icon.svg";
  final likeIcon = "Assets/interfaceicons/Like_Icon.svg";
  final dislikeIcon = "Assets/interfaceicons/Dislike_Icon.svg";

  @override
  Widget build(BuildContext context) {
    Widget exceptional = buildExceptional();
    Widget likes = buildLikes();
    Widget dislikes = buildDislikes();

    return Row(
      children: [exceptional, likes, dislikes],
    );
    // return buildExceptional(game);
  }

  Widget buildExceptional() {
    int count = 0;
    GameRatingDistribution rating = game.ratingDistribution[0];
    if (rating != null && rating.count != null) {
      count = rating.count;
    }
    return buildIconAndText(exceptionalIcon, count);
  }

  Widget buildLikes() {
    int count = 0;
    GameRatingDistribution rating = game.ratingDistribution[1];
    if (rating != null && rating.count != null) {
      count = rating.count;
    }
    return buildIconAndText(likeIcon, count);
  }

  Widget buildDislikes() {
    int count = 0;
    GameRatingDistribution rating = game.ratingDistribution[2];
    if (rating != null && rating.count != null) {
      count += rating.count;
    }

    rating = game.ratingDistribution[3];
    if (rating != null && rating.count != null) {
      count += rating.count;
    }

    return buildIconAndText(dislikeIcon, count);
  }

  Widget buildIconAndText(String svgimage, int count) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(svgimage),
        SizedBox(
          width: 10,
        ),
        BT2("$count"),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
