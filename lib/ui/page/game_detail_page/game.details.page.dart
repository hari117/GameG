import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:gameg/ui/page/game_detail_page/game.about.section.dart';
import 'package:gameg/ui/page/game_detail_page/game.deatil.top.section.dart';
import 'package:gameg/ui/page/game_detail_page/game.ratings.section.dart';
import 'package:gameg/ui/page/game_detail_page/platfrom.section.dart';
import 'package:gameg/ui/page/game_detail_page/game.detail.bottom.section.dart';
import 'package:gameg/ui/widgets/devider.widget.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';

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
            VS3(),
            VS2(),
            appbar(context),
            VS3(),
            VS2(),
            GameDetailTopSection(game),
            GameRatingsSection(game),
            GameDetailAboutSection(game),
            DeviderWidget(),
            DetailsPagePlatformSection(game),
            GameDetailBottomSection(game),
          ],
        ),
      ),
    );
  }

  appbar(BuildContext context) {
    return PagePadding(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset("Assets/interfaceicons/Back_Icon.svg"),
      ),
    );
  }
}
