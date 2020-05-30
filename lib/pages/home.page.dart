import 'package:flutter/material.dart';
import 'file:///D:/Workspace/rawg/lib/client/client.request.model.dart';
import 'package:rawg/models/page.data.model.dart';

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
  ClientRequest clientRequest = ClientRequest();
  HomePageState homeState = HomePageState.homePageState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeState.loadPage();
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

  body() {
    return StateBuilder(
        observe: () => homeState,
        builder: (context, _) {
          if (homeState.isLoading == true)
            return LoadingScreen();
          else if (homeState.isLoading == false) {
            return ListView.builder(
              itemCount: homeState.allGamesObjects.length,
              itemBuilder: (_, pos) {
                ListOfGames game = homeState.allGamesObjects[pos];
                return GameCard(game);
              },
            );
          }
        });
  }
}
