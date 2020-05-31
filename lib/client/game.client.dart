import 'package:dio/dio.dart';
import 'package:rawg/models/game.model.dart';
import 'package:rawg/models/generated/page.json.model.dart';

class GameClient {
  static final GameClient instance = GameClient();

  final String LIST_OF_GAMES_URL = "https://api.rawg.io/api/games?page=";
  final Dio dio = Dio();

  Future<List<Game>> loadGamesOnPage(int pageNumber) {
    print("check the endpoint pagenumber is $pageNumber");
    String url = "$LIST_OF_GAMES_URL$pageNumber";
    print("going to call $url");
    Future<Response> futurePage = dio.get(url);
    Future<List<Game>> gamesListFuture = futurePage.then((response) {
      print("response received for url: $url");
      var responseData = response.data;
      ListOfGamesPage listOfGamesPage = ListOfGamesPage.fromJson(responseData);
      print("Parsed $listOfGamesPage");
      List<Game> gameList = Game.getGames(listOfGamesPage);

      return gameList;
    });

    return gamesListFuture;
  }

//  Future<List<Game>> loadGamesOnPageAsync(int pageNumber) async {
//    String url = "$LIST_OF_GAMES_URL$pageNumber";
//    Response response = await dio.get(url);
//    var responseData = response.data;
//    ListOfGamesPage listOfGamesPage = ListOfGamesPage.fromJson(responseData);
//    List<Game> gamesList = [];
//    for (Result result in listOfGamesPage.results) {
//      Game game = Game();
//      game.name = result.name;
//      game.imageUrl = result.backgroundImage;
//      gamesList.add(game);
//    }
//    return gamesList;
//  }
}
