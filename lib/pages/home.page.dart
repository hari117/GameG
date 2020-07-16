import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/helperfiles/logger.helper.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/pages/homepagewidgets/appbr.widget.dart';
import 'package:gameg/pages/homepagewidgets/black.progress.indicator.widget.dart';
import 'package:gameg/pages/homepagewidgets/error.page.widget.dart';
import 'package:gameg/pages/homepagewidgets/gamecard.widget.dart';
import 'package:gameg/pages/homepagewidgets/searchbox.widget.dart';
import 'package:gameg/pages/menu.page.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import "package:gameg/helperfiles/string.extentions.dart";
import 'package:gameg/pages/homepagewidgets/appbr.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static final Logger _log = getLogger("_HomePageState");
  FigmaColors figmaColors = FigmaColors();
  ScrollController scrollController = ScrollController();
  HomePageState homeState = HomePageState.homePageState;

  String searchGame = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeState.loadNextPage();
    });
    checkPageScrollHadReachedEnd();
  }

  checkPageScrollHadReachedEnd() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
//        print("page end reached");
        homeState.loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: figmaColors.surfaceColor,
      appBar: GameGAppBar(),
      body: buildListGames(),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(46, 49, 52, 1),
      elevation: 4,
      bottomOpacity: 15.0,
      title: InkWell(
        onTap: () {
          homeState.resetState();
          homeState.loadNextPage();
        },
        child: Text(
          "GAMEG",
          style: GoogleFonts.roboto(fontSize: 20, color: figmaColors.onSurfaceColor_01),
        ),
      ),
      //  centerTitle: false,
    );
  }

  buildListGames() {
    return Column(
      children: <Widget>[
        SearchBox(),
        Expanded(
          child: StateBuilder(
              observe: () => homeState,
              builder: (context, _) {
                if (homeState.isError == true && homeState.isLoading == false) {
                  return ErrorPage();
                  //} else if (homeState.isLoading && homeState.listOfGames.length == 0 && homeState.isError==false ) {
                } else if (homeState.isLoading && homeState.listOfGames.length==0) {
                  return Center(child: BlackProgressIndicatorWidget());
                } else if (homeState.isLoading == false && homeState.isError == false) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: homeState.listOfGames.length + 1,
                    itemBuilder: (_, pos) {
                      // show loading when reached end of list
                      if (pos == homeState.listOfGames.length) {
                        return Center(child: BlackProgressIndicatorWidget());
                      }
                      Game game = homeState.listOfGames[pos];

                      return GameCard(game);
                    },
                  );
                }
              }),
        )
      ],
    );
  }
}
