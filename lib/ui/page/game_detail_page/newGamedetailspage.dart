import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:gameg/ui/page/game_detail_page/game.about.section.dart';
import 'package:gameg/ui/page/game_detail_page/game.deatil.top.section.dart';
import 'package:gameg/ui/page/game_detail_page/game.ratings.section.dart';
import 'package:gameg/ui/page/game_detail_page/platfrom.section.dart';
import 'package:gameg/ui/page/game_detail_page/tags.generator.dart';
import 'package:gameg/ui/page/game_detail_page/wheretobuy.section.dart';
import 'package:gameg/ui/widgets/devider.widget.dart';

class NewGameDetailsPage extends StatelessWidget {
  fignaTheams fg = fignaTheams();
  HomePageState homeState = HomePageState.homePageState;
  Game game;

  NewGameDetailsPage(this.game);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fg.elevation_01,
      //appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appbar(context),
            GameDetailTopSection(game),
            GameRatingsSection(game),
            GameDetailAboutSection(game),
            DeviderWidget(),
            DetailsPagePlatformSection(game),
            secondpart(),
          ],
        ),
      ),
    );
  }

  appbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15),
      child: Container(
        height: 40,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: fg.onSurfaceColor_03,
          ),
        ),
      ),
    );
  }

  secondpart() {
    return Container(
      width: double.infinity,
      color: fg.surfaceColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WhereToBuySection(game),
          TagsGenerator(game),
        ],
      ),
    );
  }
}
