import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:rawg/pages/game.details.page.dart';
import 'package:rawg/pages/homepagewidgets/black.progress.indicator.widget.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';

class GameCard extends StatelessWidget {
  HomePageState homeState = HomePageState.homePageState;
  Game game;

  GameCard(this.game);

  Widget build(BuildContext context) {
    //  print("game id is ${game.gameId}");
    return Center(
      child: Container(
        height: 360,
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(),
                width: double.infinity,
                height: 230,
                child: CachedNetworkImage(
                  imageUrl: game.imageUrl,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: BlackProgressIndicatorWidget()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => GameDetailsPage(game),
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(32, 32, 32, 1),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                      child: InkWell(
                        onTap: () {
                          print("calling gameDetailsPage");
                        },
                        child: Text(
                          "${game.name} ",
                          style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
