import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawg/models/generated/page.json.model.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:rawg/modules/future_network_image/future.network.image.widget.dart';
import 'package:rawg/pages/game.details.page.dart';
import 'package:rawg/pages/homepagewidgets/metricpoint.widget.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';
import 'package:rawg/helperfiles/svg.imges.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class GameCard extends StatefulWidget {
  Game game;

  GameCard(this.game);

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  HomePageState homeState = HomePageState.homePageState;

  int imageSliderIndex = 0;

  Widget build(BuildContext context) {
    return StateBuilder(
        observe: () => homeState,
        builder: (context, _) {
          return Center(
            child: Container(
              margin: EdgeInsets.all(10),
//              width: MediaQuery.of(context).size.width - 70,
//              height: 250,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 32, 32, 1),
                        ),
                        height: 150,
                        child: Stack(
                          children: [
                            PageView.builder(
                                onPageChanged: (value) {
                                  imageSliderIndex = value;
                                  setState(() {});
                                },
                                itemCount: widget.game.screenShotUrls.length > 6
                                    ? 6
                                    : widget.game.screenShotUrls.length,
                                itemBuilder: (_, pos) {
                                  return gameCardImagePageview(pos);
                                }),
                            genImageIndicator(widget.game.screenShotUrls.length, imageSliderIndex),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => GameDetailsPage(widget.game),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(32, 32, 32, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(9), bottomRight: Radius.circular(15)),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              suppportedPlatformWidget(),
                              MetricPoint(widget.game),
                            ],
                          ),
                          Text(
                            "${widget.game.name} ",
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  gameCardImagePageview(int index) {
    return FutureNetworkImage(widget.game.name, widget.game.screenShotUrls[index]);
  }

//  gameCardImagePageviewIndicator(int num, double w) {
//    return Padding(
//      padding: const EdgeInsets.symmetric(horizontal: 5),
//      child: Container(
//        color: Color.fromRGBO(32, 32, 32, 1),
//        child: SizedBox(
//          width: w,
//        ),
//      ),
//    );
//  }

  genImageIndicator(int numOfContainers, int activeIndex) {
    if (numOfContainers <= 1) {
      return SizedBox();
    } else if (numOfContainers > 6) {
      numOfContainers = 6;
    }
    List<Widget> indicators = [];
    for (int ii = 0; ii < numOfContainers; ii++) {
      indicators.add(indicatorContainer(activeIndex, ii));
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: indicators,
      ),
    );
  }

  indicatorContainer(int activeIndex, int containerNumber) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 5,
          decoration: BoxDecoration(
            color: activeIndex == containerNumber ? Colors.grey : Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  suppportedPlatformWidget() {
    List<Widget> svg = List();
    for (int i = 0; i < widget.game.parentPlatform.length; i++) {
      svg.add(platformIconWidgetFor(widget.game.parentPlatform[i]));
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
