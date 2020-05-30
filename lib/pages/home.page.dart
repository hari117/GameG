import 'package:flutter/material.dart';
import 'package:rawg/models/game.model.dart';
import 'file:///D:/Workspace/rawg/lib/client/client.request.model.dart';
import 'package:rawg/pages/homepagewidgets/gamecard.widget.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'homepagewidgets/loadingscreen.widget.dart';

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
    checkEndPage();
  }

  checkEndPage() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("page end reached");
        homeState.loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(), backgroundColor: Colors.teal, body: body());
  }

  appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "RawG  ",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      centerTitle: true,
    );
  }

  Widget body() {
    return StateBuilder(
        observe: () => homeState,
        builder: (context, _) {
          if (homeState.isLoading) {
            return LoadingScreen();
          } else {
            return ListView.builder(
              controller: scrollController,
              itemCount: homeState.listOfGames.length + 1,
              itemBuilder: (_, pos) {
                print("widget building $pos");
                if (homeState.listOfGames.length == pos) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  Game game = homeState.listOfGames[pos];
                  return GameCard(game);
                }
              },
            );
          }
        });
  }
}
