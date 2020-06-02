import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawg/pages/homepagewidgets/black.progress.indicator.widget.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flutter_read_more_text/flutter_read_more_text.dart';

class GameCardPage extends StatelessWidget {
  String gameName;
  String imgUrl;

  GameCardPage(this.gameName, this.imgUrl);

  HomePageState homeState = HomePageState.homePageState;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        body: StateBuilder(
          observe: () => homeState,
          builder: (context, _) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: imgUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      textBuild(
                        "${gameName}",
                        50,
                        0,
                        50,
                        0,
                        FontWeight.bold,
                        25,
                      ),
                      textBuild(
                        "ABOUT",
                        40,
                        20,
                        0,
                        0,
                        FontWeight.w700,
                        30,
                      ),
                      if (homeState.isGamePageLoad)
                        description(
                          homeState.gameCardPage.gameDescription,
                        ),
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

  description(String content) {
    return StateBuilder(
      observe: () => homeState,
      builder: (context, _) {
        return Container(
          child: Column(
            children: [
              Container(
                height: homeState.height,
                child: Text(content,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ),
              InkWell(
                onTap: () {
                  if (homeState.showLess) {
                    homeState.changeContainer(
                      100,
                      "ShowMore",
                    );

                    print(homeState.height);
                  } else {
                    homeState.changeContainer(
                      500,
                      "ShowLess",
                    );

                    print(homeState.height);
                  }
                  homeState.showLess = !homeState.showLess;
                  print(homeState.showLess);
                },
                child: Text(
                  "${homeState.contentIndicator}",
                  style: GoogleFonts.roboto(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  textBuild(String content, double topPadding, double bottomPadding,
      double leftPadding, double rightPadding, FontWeight weight, double size) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding,
          bottom: bottomPadding,
          left: leftPadding,
          right: rightPadding),
      child: Text(
        content,
        style: GoogleFonts.roboto(
            color: Colors.white, fontSize: size, fontWeight: weight),
      ),
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
}
