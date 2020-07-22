import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/helperfiles/svg.imges.dart';
import 'package:gameg/models/generated/page.json.model.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/modules/future_network_image/future.network.image.widget.dart';
import 'package:gameg/pages/game.details.page.dart';
import 'package:gameg/pages/homepagewidgets/game.rating.widget.dart';
import 'package:gameg/pages/homepagewidgets/metricpoint.widget.dart';
import 'file:///D:/Flutter%20Apps/RealTimeApps/gameg/lib/ui/widgets/platfrom.icons.widget.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';
import 'file:///D:/Flutter%20Apps/RealTimeApps/gameg/lib/ui/page/game_detail_page/newGamedetailspage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:states_rebuilder/states_rebuilder.dart';

class GameCard extends StatefulWidget {
  Game game;

  GameCard(this.game);

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  HomePageState homeState = HomePageState.homePageState;
  fignaTheams figmaColors = fignaTheams();

  Widget build(BuildContext context) {
    return StateBuilder(
      observe: () => homeState,
      builder: (context, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () {
              homeState.loadDescription(widget.game);
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => NewGameDetailsPage(widget.game),
                ),
              );
            },
            child: Container(
              //  height: 331,

              decoration: BoxDecoration(color: figmaColors.elevation_01, boxShadow: [
                BoxShadow(
                  offset: Offset(1, 0),
                  blurRadius: 1,
                  color: Color(000000),
                )
              ]),
              child: Column(
                children: [
                  gameCardTopPart(),
                  gameCardMiddlePart(),
                  gameCardBottomPart(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  gameCardTopPart() {
    return Container(
      // height: 72,
      child: PagePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            VS3(),
            H5(widget.game.name),
            VS2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlatformIconsWidget(widget.game),
              ],
            ),
            VS2(),
          ],
        ),
      ),
    );
  }

  gameCardMiddlePart() {
    return Container(width: double.infinity, height: 199, child: gameCardImagePageview(0));
  }

  gameCardBottomPart() {
    return PagePadding(
      child: Container(
        width: double.infinity,
        height: 59,
        child: GameRatings(widget.game),
      ),
    );
  }

  gameCardImagePageview(int index) {
    return FutureNetworkImage(widget.game.name, widget.game.screenShotUrls[index]);
  }
}
