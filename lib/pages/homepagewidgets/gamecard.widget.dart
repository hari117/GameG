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
import 'package:gameg/rebuilderstates/home.satate.dart';
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
  FigmaColors figmaColors = FigmaColors();
  int imageSliderIndex = 0;

  Widget build(BuildContext context) {
    return StateBuilder(
      observe: () => homeState,
      builder: (context, _) {
        return Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => GameDetailsPage(widget.game),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                //  height: 331,

                  decoration: BoxDecoration(
                      color: figmaColors.elevation_01,
                    boxShadow: [
                      BoxShadow(

                        offset: Offset(1,0),
                        blurRadius: 1,
                        color: Color(000000),
                      )
                    ]
                  ),
                child: Column(
                  children: [
                    Container(
                     // height: 72,
                      child: Padding(
                        padding: const EdgeInsets.only(left:30.0,top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${widget.game.name} ",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                suppportedPlatformWidget(),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: 199,
                        child: Image.network(
                          "${widget.game.screenShotUrls[0]}",
                          fit: BoxFit.cover,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(
                        width: double.infinity,
                        height: 59,
                        child:GameRatings(widget.game),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  gameCardImagePageview(int index) {
    return FutureNetworkImage(
        widget.game.name, widget.game.screenShotUrls[index]);
  }


  suppportedPlatformWidget() {
    List<Widget> svg = List();
    for (int i = 0; i < widget.game.parentPlatform.length; i++) {
      svg.add(platformIconWidgetFor(widget.game.parentPlatform[i]));
      svg.add(SizedBox(width: 15,));
    }
    return Row(
      children: svg,
    );
  }

  Widget platformIconWidgetFor(PlatformName platformName) {
    if (SvgImagesMap.platformIcons.containsKey(platformName)) {
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: SvgPicture.asset(SvgImagesMap.platformIcons[platformName]),
      );
    } else {
      return SizedBox();
    }
    //if (platformName)
  }
}
