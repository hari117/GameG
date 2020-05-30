import 'package:flutter/material.dart';
import 'package:rawg/models/game.model.dart';
import 'package:rawg/models/page.data.model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';

class GameCard extends StatelessWidget {
  HomePageState homeState = HomePageState.homePageState;
  Game game;

  GameCard(this.game);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.indigoAccent),
      margin: EdgeInsets.all(10),
      height: 320,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              "${game.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 120,
            color: Colors.indigoAccent,
            child: Center(
              child: Text("${game.name}"),
            ),
          ),
        ],
      ),
    );
  }
}
