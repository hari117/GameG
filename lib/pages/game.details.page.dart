import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:rawg/pages/homepagewidgets/black.progress.indicator.widget.dart';
import 'package:rawg/pages/homepagewidgets/gamecard.widget.dart';
import 'package:rawg/pages/homepagewidgets/text.widget.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailsPage extends StatelessWidget {
  Game game;

  GameDetailsPage(this.game); //  GameCardPage(this.gameName, this.imgUrl);

  HomePageState homeState = HomePageState.homePageState;

  @override
  Widget build(BuildContext context) {
    print("clicking ${game.name}  ${game.gameId}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        body: StateBuilder(
          initState: (_, model) {
            //     print("calling loadGameDetailsPageAPI");
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              homeState.loadGameDetailsPage(game);
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
                        game.name,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      imagesListView(),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    ratingsColorContainer(Color.fromRGBO(85, 124, 224, 1)),
                                    //    ratingsText("Recommended", 1)
                                  ],
                                ),
                                Row(
                                  children: [
                                    ratingsColorContainer(Colors.green),
                                    //  ratingsText("Exceptional", 0)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    ratingsColorContainer(Colors.yellow),
                                    //   ratingsText("Meh", 2),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ratingsColorContainer(Colors.red),
                                    //   ratingsText("Skip", 3),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      TextWidget("About", 20, 20, 0, 0, FontWeight.w700, 30, Color.fromRGBO(63, 56, 38, 1), 1),
                      if (homeState.isGamePageLoad)
                        description(
                          game.description,
                        ),
                      if (!homeState.isGamePageLoad) prograssIndicator(),
                      detailsSection(),
                      TextWidget("Where to Buy", 10, 10, 0, 0, FontWeight.w500, 25, Color.fromRGBO(63, 56, 38, 1), 1),
                      storeBuilder(),
                      centerNameInCenter("Games Like  ${game.name}"),
                      if (homeState.isGamePageLoad)
                        StateBuilder(
                            observe: () => homeState,
                            builder: (context, _) {
                              return Column(
                                children: [
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: game.relatedGames.length,
                                      itemBuilder: (_, pos) {
                                        return GameCard(game.relatedGames[pos]);
                                      }),
                                ],
                              );
                            }),
                      if (!homeState.isGamePageLoad) prograssIndicator(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
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
            itemCount: game.screenShots.length,
            itemBuilder: (_, pos) {
              return Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: CachedNetworkImage(
                  imageUrl: game.screenShots[pos],
                  fit: BoxFit.cover,
                ),
              );
            }),
      ),
    );
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
                TextWidget("Platform", 10, 0, 0, 0, FontWeight.w500, 25, Color.fromRGBO(63, 56, 38, 1), 1),
                showPlatforms(game.platform),
                TextWidget("Genres", 10, 0, 0, 0, FontWeight.w500, 25, Color.fromRGBO(63, 56, 38, 1), 1),
                showPlatforms(game.genres),
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
                relaseData(),
                TextWidget("Metrics", 10, 10, 0, 0, FontWeight.w500, 25, Color.fromRGBO(63, 56, 38, 1), 1),
                metricsScore(),
              ],
            ),
          ),
        )
      ],
    );
  }

  relaseData() {
    if (game.releaseData == null) {
      return SizedBox();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget("Release Date", 10, 0, 0, 0, FontWeight.w500, 25, Color.fromRGBO(63, 56, 38, 1), 1),
          TextWidget("${DateFormat.yMd().format(game.releaseData)}", 10, 0, 0, 0, FontWeight.w400, 17, Colors.white, 1),
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
          itemCount: game.stores.length,
          itemBuilder: (_, pos) {
            return urlLancherButton(pos);
          }),
    );
  }

  urlLancherButton(int index) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 240,
      child: RaisedButton(
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Color.fromRGBO(32, 32, 32, 1),
        onPressed: () {
          _launchURL(game.stores[index].url);
          // print("url lanched");
        },
        child: Text(
          game.stores[index].websiteName,
          style: GoogleFonts.roboto(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1),
        ),
      ),
    );
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
      fullList = fullList + plat[i] + ",";
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
                    child: Text(content,
                        style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
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

                  print(homeState.height);
                } else {
                  homeState.changeContainer(
                    null,
                    "ShowLess...",
                  );

                  print(homeState.height);
                }
                homeState.showHigh = !homeState.showHigh;
                print(homeState.showHigh);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "${homeState.contentIndicator}",
                    style: GoogleFonts.roboto(
                        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 1),
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

  ratingsColorContainer(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  ratingsText(String name, Index) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Text(
        "$name  ${game.ratings[3]} ",
        style: GoogleFonts.roboto(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1),
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
        child: TextWidget("${game.metaScore}", 10, 10, 0, 0, FontWeight.w400, 17, Colors.white, 1),
      ),
    );
  }

  centerNameInCenter(
    String name,
  ) {
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
