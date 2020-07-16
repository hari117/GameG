import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/helperfiles/svg.imges.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/modules/future_network_image/future.network.image.widget.dart';
import 'package:gameg/pages/homepagewidgets/black.progress.indicator.widget.dart';
import 'package:gameg/pages/homepagewidgets/game.rating.widget.dart';
import 'package:gameg/pages/homepagewidgets/gamecard.widget.dart';
import 'package:gameg/pages/homepagewidgets/metricpoint.widget.dart';
import 'package:gameg/pages/homepagewidgets/text.widget.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailsPage extends StatefulWidget {
  Game game;

  GameDetailsPage(this.game);

  @override
  _GameDetailsPageState createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  FigmaColors figmaColors = FigmaColors();
  HomePageState homeState = HomePageState.homePageState;
  ScrollController suggestedGamesScrollControler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    suggestedGamesScrollControler = ScrollController();
    suggestedGamesScrollControler.addListener(() {
      if (suggestedGamesScrollControler.position.pixels == suggestedGamesScrollControler.position.maxScrollExtent) {
        //   homeState.
        homeState.loadDescription(widget.game);
//        print("the relatedgames page counted is ${homeState.relatedGamesPageCount}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("clicking ${widget.game.name}  ${widget.game.gameId}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: figmaColors.elevation_01,
        appBar: AppBar(
          backgroundColor: figmaColors.elevation_01,
          leading: SizedBox(
            width: 18,
            height: 18,

            child: FittedBox(fit: BoxFit.cover,
            child: InkWell(
              onTap: (){
                Navigator.push;
              },
              child: SvgPicture.asset(
                "Assets/interfaceicons/Back_Icon.svg",
              ),
            ),
          ),
        ),
      ),

      body: StateBuilder(
        initState: (_, model) {
          //     print("calling loadGameDetailsPageAPI");
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            homeState.loadDescription(widget.game);
          });
        },
        observe: () => homeState,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    centerNameInCenter(
                      widget.game.name,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    imagesListView(),
                    SizedBox(
                      height: 25,
                    ),
                    TextWidget(
                        "About",
                        20,
                        20,
                        0,
                        0,
                        FontWeight.w700,
                        30,
                        Color.fromRGBO(63, 56, 38, 1),
                        1),
                    if (homeState.isDescriptionLoad)
                      description(
                        widget.game.description,
                      ),
                    if (!homeState.isDescriptionLoad)
                      prograssIndicator(),
                    detailsSection(),
                    TextWidget(
                        "Where to Buy",
                        10,
                        10,
                        0,
                        0,
                        FontWeight.w500,
                        25,
                        Color.fromRGBO(63, 56, 38, 1),
                        1),
                    storeBuilder(),
                    //           centerNameInCenter("Games Like  ${widget.game.name}"),
//                      if (homeState.isGamePageLoad)
//                        StateBuilder(
//                          observe: () => homeState,
//                          builder: (context, _) {
//                            return Column(
//                              children: [
//                                ListView.builder(
//                                  controller: suggestedGamesScrollControler,
//                                  //  physics: NeverScrollableScrollPhysics(),
//                                  shrinkWrap: true,
//                                  scrollDirection: Axis.vertical,
//                                  itemCount: widget.game.relatedGames.length,
//                                  itemBuilder: (_, pos) {
////                                    if (pos == widget.game.relatedGames.length) {
////                                      return Center(child: BlackProgressIndicatorWidget());
////                                    }
//                                    return GameCard(widget.game.relatedGames[pos]);
//                                  },
//                                ),
//                              ],
//                            );
//                          },
//                        ),
//                      if (!homeState.isGamePageLoad) prograssIndicator(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),);
  }

  imagesListView() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(15),
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: Container(
        width: 400,
        height: 250,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.game.screenShotUrls.length,
            itemBuilder: (_, pos) {
              return Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: imageBuilder(pos),
              );
            }),
      ),
    );
  }

  imageBuilder(int index) {
    return FutureNetworkImage(widget.game.name, widget.game.screenShotUrls[index]);
  }

  detailsSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            //  color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    "Platform",
                    10,
                    0,
                    0,
                    0,
                    FontWeight.w500,
                    25,
                    Color.fromRGBO(63, 56, 38, 1),
                    1),
                showPlatforms(widget.game.platform),
                TextWidget(
                    "Genres",
                    10,
                    0,
                    0,
                    0,
                    FontWeight.w500,
                    25,
                    Color.fromRGBO(63, 56, 38, 1),
                    1),
                showPlatforms(widget.game.genres),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            //  color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    "Metrics",
                    10,
                    10,
                    0,
                    0,
                    FontWeight.w500,
                    25,
                    Color.fromRGBO(63, 56, 38, 1),
                    1),
                MetricPoint(widget.game),
                relaseData(),
              ],
            ),
          ),
        )
      ],
    );
  }

  relaseData() {
    if (widget.game.releaseData == null) {
      return SizedBox();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
              "Release Date",
              10,
              0,
              0,
              0,
              FontWeight.w500,
              25,
              Color.fromRGBO(63, 56, 38, 1),
              1),
          TextWidget(
              "${DateFormat.yMd().format(widget.game.releaseData)}",
              10,
              0,
              0,
              0,
              FontWeight.w400,
              17,
              Colors.white,
              1),
        ],
      );
    }
  }

  storeBuilder() {
    return Container(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.game.stores.length,
          itemBuilder: (_, pos) {
            return storeButton(pos);
          }),
    );
  }

  storeButton(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: RaisedButton(
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Color.fromRGBO(32, 32, 32, 1),
        onPressed: () {
          _launchURL(widget.game.stores[index].url);
          // print("url lanched");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              Text(
                widget.game.stores[index].websiteName,
                style: GoogleFonts.roboto(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1),
              ),
              storeIconPlacer(widget.game.stores[index].websiteName),
            ],
          ),
        ),
      ),
    );
  }

  storeIconPlacer(String storeName) {
//    print("the icon name is ********$storeName*********");
    if (SvgImagesMap.shopIcons.containsKey(storeName))
      return Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
        child: SvgPicture.asset(
          SvgImagesMap.shopIcons['$storeName'],
          width: 30,
        ),
      );
    else
      return SizedBox();
  }

  _launchURL(String urlpage) async {
    if (await canLaunch(urlpage)) {
      await launch(urlpage);
    } else {
      throw 'Could not launch $urlpage';
    }
  }

  showPlatforms(List<String> plat) {
    //  print("${game.stores[0].websiteName}");
    String fullList = "";
    for (int i = 0; i < plat.length; i++) {
      fullList = fullList + plat[i] + "     ";
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        "$fullList",
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }

  description(String content) {
    //   print(content);
    return StateBuilder(
      observe: () => homeState,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: homeState.height,
                    child: Text(content, style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (homeState.showHigh) {
                  homeState.changeContainer(
                    100,
                    "ShowMore...",
                  );

//                  print(homeState.height);
                } else {
                  homeState.changeContainer(
                    null,
                    "ShowLess...",
                  );

//                  print(homeState.height);
                }
                homeState.showHigh = !homeState.showHigh;
//                print(homeState.showHigh);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  //      color: Colors.white,
                  child: Text(
                    "${homeState.contentIndicator}",
                    style: GoogleFonts.roboto(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  prograssIndicator() {
    return SizedBox(
      height: 300,
      child: Center(
        child: BlackProgressIndicatorWidget(),
      ),
    );
  }

  metricsScore() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.green),
      ),
      child: Center(
        child: TextWidget(
            "${widget.game.metaScore}",
            10,
            10,
            0,
            0,
            FontWeight.w400,
            17,
            Colors.white,
            1),
      ),
    );
  }

  centerNameInCenter(String name) {
    return Container(
      //  color: Colors.blue,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Text(
            name,
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold, letterSpacing: 2),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
