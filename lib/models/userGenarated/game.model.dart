import 'package:rawg/models/generated/page.json.model.dart';

class Game {
  int gameId;
  int exceptional;
  int recommended;
  int meh;
  int skip;

  String name;
  String imageUrl;
  String minSystemRequirement;
  String maxSystemRequirement;

  DateTime releaseData;
  List<int> ratings = List();
  List<String> platform = List();
  List<String> screenShots = List();

  static List<Game> getGames(ListOfGamesPage listOfGamesPage) {
    List<Game> newGameList = [];
    for (Result result in listOfGamesPage.results) {
      Game game = Game();
      game.gameId = result.id;
      game.name = result.name;
      game.imageUrl = result.backgroundImage;

      for (Rating rating in result.ratings) {
//        game.exceptional = rating.count;
//        game.recommended = rating.count;
//        game.meh = rating.count;
//        game.skip = rating.count;
        game.ratings.add(rating.count);
      }

      //adding platform detains to gameObject
      for (PlatformElement platformElement in result.platforms) {
        String plat = platformElement.platform.name;
        game.releaseData = platformElement.releasedAt;

        game.platform.add(plat);
      }

      // adding imges to gameObject
      for (ShortScreenshot screenshot in result.shortScreenshots) {
        String img = screenshot.image;
        game.screenShots.add(img);
      }
      newGameList.add(game);
    }
    return newGameList;
  }
}
