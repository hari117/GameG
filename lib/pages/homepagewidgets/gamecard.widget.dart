import 'package:flutter/material.dart';
import 'package:rawg/models/game.model.dart';

import 'package:cached_network_image/cached_network_image.dart';

class GameCard extends StatelessWidget {
//  HomePageState homeState = HomePageState.homePageState;
  Game game;

  GameCard(this.game);

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        height: 320,
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                decoration: BoxDecoration(),
                width: double.infinity,
                height: 200,
                child: Image.network(
                  game.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(32, 32, 32, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              height: 120,
              child: Center(
                child: Text(
                  "${game.name}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
