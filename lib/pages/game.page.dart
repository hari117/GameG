import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flutter_read_more_text/flutter_read_more_text.dart';

class GameCardPage extends StatelessWidget {
  String gameName;
  String imgUrl;
  String firstHalf = "";
  String secondHalf = "";

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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        readMore("${homeState.gameCardPage.gameDescription}"),
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
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
        ),
      ),
    );
  }

  readMore(String content) {
    if (content.length > 50) {
      firstHalf = content.substring(0, 50);
      secondHalf = content.substring(50, content.length);
    } else {
      firstHalf = content;
      secondHalf = "";
    }
    return StateBuilder(
        observe: () => homeState,
        builder: (context, _) {
          return secondHalf.isEmpty
              ? Text(firstHalf, style: TextStyle(color: Colors.white))
              : Column(
                  children: [
                    Text(
                      homeState.flag
                          ? (firstHalf + "...")
                          : (firstHalf + secondHalf),
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        homeState.flag = !homeState.flag;
                        print("the flag value is ${homeState.flag}");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          new Text(
                            homeState.flag ? "show more" : "show less",
                            style: new TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    )
                  ],
                );
        });
  }
}
