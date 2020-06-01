import 'package:rawg/models/generated/page.json.model.dart';

class Game {
  int gameId;
  String name;
  String imageUrl;

  static List<Game> getGames(ListOfGamesPage listOfGamesPage) {
    List<Game> newGameList = [];
    for (Result result in listOfGamesPage.results) {
      Game game = Game();
      game.gameId = result.id;
      game.name = result.name;
      game.imageUrl = result.backgroundImage;
      newGameList.add(game);
    }
    return newGameList;
  }
}
