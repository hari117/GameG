import 'package:flutter/material.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';
import 'package:intl/intl.dart';
import 'package:gameg/helperfiles/string.extentions.dart';
class DetailsPagePlatformSection extends StatelessWidget {
  Game game;

  DetailsPagePlatformSection(this.game);

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VS3(),
          H5("Platfroms"),
          VS2(),
          showPlatformsAndGenres(game.platform),
          VS3(),
          H5("Genres"),
          VS2(),
          showPlatformsAndGenres(game.genres),
          VS3(),
          releaseDataAndAgeRating(),
          VS3(),
        ],
      ),
    );
  }

  showPlatformsAndGenres(List<String> plat) {
    String fullList = "";
    String temp="";
    for (int i = 0; i < plat.length; i++) {
       temp=plat[i].capitalize();
      fullList = fullList + temp + "     ";
    }
    return BT2("$fullList");
  }

  releaseDataAndAgeRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        VS2(),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                H5("Release Date"),
                VS2(),
                relaseData(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                H5("Age Rating"),
                VS2(),
                BT2("NA"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  relaseData() {
    if (game.releaseData == null) {
      return BT2("NA");
    } else {
      return BT2("${DateFormat.yMd().format(game.releaseData)}");
    }
  }
}
