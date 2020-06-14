import 'package:rawg/models/generated/page.json.model.dart';

class Game {
  int gameId;
  int metaScore;

  String name;
  String imageUrl;
  String description = "";

  DateTime releaseData;

  List<String> genres = List();
  List<String> platform = List();
  List<PlatformName> parentPlatform = List();
  List<String> screenShotUrls = List();

  List<Stores> stores = List();
  List<RatingsToGame> ratings = List();

  List<Game> relatedGames = List();

  static List<Game> getGamesFrom(ListOfGamesPage listOfGamesPage) {
    List<Game> newGameList = [];

    for (Result result in listOfGamesPage.results) {
      Game game = Game();
      game.gameId = result.id;
      game.name = result.name;
      game.imageUrl = result.backgroundImage;
      game.metaScore = result.metacritic == null ? 0 : result.metacritic;

      game.releaseData = result.released;
      //adding genres to tha gameObject
      for (Genre genre in result.genres) {
        game.genres.add(genre.slug);
      }

      //adding ratings to gameObject
      for (Rating rating in result.ratings) {
        RatingsToGame r = RatingsToGame();
        r.title = rating.title;
        r.Count = rating.count;
        game.ratings.add(r);
      }

      //adding parentplatform details to gameObject
      for (ParentPlatform parentPlatform in result.parentPlatforms) {
        PlatformName name = parentPlatform.platform.name;
        //  print("printing tha parentPlatform names ${name.toString()}");
        game.parentPlatform.add(name);
      }

      //adding platform detains to gameObject
      for (PlatformElement platformElement in result.platforms) {
        String plat = platformElement.platform.name;
        game.platform.add(plat);
      }

      // adding imges to gameObject
      for (ShortScreenshot screenshot in result.shortScreenshots) {
        String img = screenshot.image;
        game.screenShotUrls.add(img);
      }

      //adding Gamestores links to the gameObject
      for (Store store in result.stores) {
        Stores s = Stores();
        s.websiteName = store.store.name;
        s.url = store.urlEn;
        game.stores.add(s);
      }

      //adding ratings to the gameObject
      newGameList.add(game);
    }
    return newGameList;
  }
}

class Stores {
  String websiteName;
  String url;
}

class RatingsToGame {
  Title title;
  int Count;
}
