import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:rawg/pages/homepagewidgets/black.progress.indicator.widget.dart';
import 'package:rawg/pages/homepagewidgets/gamecard.widget.dart';
import 'package:rawg/pages/menu.page.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  HomePageState homeState = HomePageState.homePageState;

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
      appBar: appBar(),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: buildingListOfGames(),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: InkWell(
          onTap: () {
            homeState.resetState();
            homeState.loadNextPage();
          },
          child: Text(
            "RAWG ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 4),
          ),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          iconSize: 30,
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => MenuOptions(),
              ),
            );
          },
        ),
      ],
    );
  }

  buildingListOfGames() {
    return StateBuilder(
        observe: () => homeState,
        builder: (context, _) {
          if (homeState.isLoading && homeState.listOfGames.length == 0) {
            return Center(child: BlackProgressIndicatorWidget());
          } else {
            return ListView.builder(
              controller: scrollController,
              itemCount: homeState.listOfGames.length + 1,
              itemBuilder: (_, pos) {
                // show loading when reached end of list
                if (pos == homeState.listOfGames.length) {
                  return Center(child: BlackProgressIndicatorWidget());
                }
                if (pos == 0) {
                  return headLinesBody();
                }
                Game game = homeState.listOfGames[pos - 1];
                return GameCard(game);
              },
            );
          }
        });
  }

  headLinesBody() {
    var headListText = homeState.genres == null ? "New and trending" : "${homeState.genres.toUpperCase()} Games";
    return Container(
      width: double.infinity,

      color: Color.fromRGBO(0, 0, 0, 1),
      //  color: Colors.blue,
      child: Column(
        children: [
          heightgap(),
          headLinesText(headListText, 30, FontWeight.bold),
          heightgap(),
//          headLinesText("Based on player counts and release data", 20, FontWeight.w400),
//          heightgap()
        ],
      ),
    );
  }

  headLinesText(String headLine, double size, FontWeight fontWeight) {
    return Text(headLine, style: GoogleFonts.ubuntu(color: Colors.white, fontWeight: fontWeight, fontSize: size));
  }

  heightgap() {
    return SizedBox(
      height: 15,
    );
  }
}
