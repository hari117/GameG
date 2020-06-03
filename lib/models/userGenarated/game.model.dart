import 'package:rawg/models/generated/page.json.model.dart';

class Game {
  int gameId;
  int metaScore;
  String name;
  String imageUrl;
  String minSystemRequirement;
  String maxSystemRequirement;

  DateTime releaseData;
  List<String> genres = List();
  List<int> ratings = List();
  List<String> platform = List();
  List<String> screenShots = List();
  List<Stores> stores = List();
  static List<Game> getGames(ListOfGamesPage listOfGamesPage) {
    List<Game> newGameList = [];
    for (Result result in listOfGamesPage.results) {
      Game game = Game();
      game.gameId = result.id;
      game.name = result.name;
      game.imageUrl = result.backgroundImage;
      game.metaScore = result.metacritic;

      //adding genres to tha gameObject
      for (Genre genre in result.genres) {
        game.genres.add(genre.slug);
      }

      //adding ratings to gameObject
      for (Rating rating in result.ratings) {
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

      //adding Gamestores links to the gameObject
      for (Store store in result.stores) {
        Stores s = Stores();
        s.websiteName = store.store.slug;
        s.url = store.urlEn;
        game.stores.add(s);
      }

      newGameList.add(game);
    }

    return newGameList;
  }
}

class Stores {
  String websiteName;
  String url;
}
