import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawg/models/game.model.dart';
import 'package:rawg/pages/game.page.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';

class GameCard extends StatelessWidget {
  HomePageState homeState = HomePageState.homePageState;
  Game game;

  GameCard(this.game);

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 360,
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          children: [
            ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
                width: double.infinity,
                height: 230,
                child: CachedNetworkImage(
                  imageUrl: game.imageUrl,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black54),
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
//                child: Image.network(
//                  game.imageUrl,
//                  fit: BoxFit.cover,
//                  loadingBuilder: (BuildContext context, Widget child,
//                      ImageChunkEvent loadingProgress) {
//                    if (loadingProgress == null) {
//                      return child;
//                    } else {
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//                    }
//                  },
//                ),
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(32, 32, 32, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    GameCardPage(game.name, game.imageUrl)));

                        homeState.loadGameCardPage(game.gameId);
                      },
                      child: Text(
                        "${game.name} ",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
