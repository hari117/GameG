import 'package:dio/dio.dart';
import 'package:rawg/models/generated/gamecardpage.json.model.dart';
import 'package:rawg/models/generated/page.json.model.dart';
import 'package:rawg/models/userGenarated/game.model.dart';

class GameClient {
  static final GameClient instance = GameClient();

  final String LIST_OF_GAMES_URL = "https://api.rawg.io/api/games?page=";
  final String GAME_CARD_PAGE_URL = "https://api.rawg.io/api/games/";
  final Dio dio = Dio();

  Future<List<Game>> loadGamesOnPage(int pageNumber) {
    //  print("check the endpoint pagenumber is $pageNumber");
    String url = "$LIST_OF_GAMES_URL$pageNumber";
    //   print("going to call $url");
    Future<Response> futurePage = dio.get(url);
    //   print("futurePage $futurePage");
    Future<List<Game>> gamesListFuture = futurePage.then((response) {
      //    print("response received for url: $url");
      var responseData = response.data;
      ListOfGamesPage listOfGamesPage = ListOfGamesPage.fromJson(responseData);
      //   print("Parsed $listOfGamesPage");
      List<Game> gameList = Game.getGames(listOfGamesPage);

      return gameList;
    });
    return gamesListFuture;
  }

  Future GameID(Game game) async {
    String description = await loadGameDescription(game.gameId);
    //  print("sucessfully completed description funtion");
    List<Game> suggested = await suggestRelatedGames(game.gameId);
    //  print("sucessfully completed suggested funtion");
    return Future.value([description, suggested]);
  }

  Future suggestRelatedGames(int gameId) async {
    //  print("check the endpoint pagenumber is $pageNumber");
    String url = "https://api.rawg.io/api/games/$gameId/suggested";
    //   print("going to call $url");
    Response futurePage = await dio.get(url);
    //  print("futureSuggested page games $futurePage");
    var games = futurePage.data;
    //  print("futureSuggested parsed data $games");
    ListOfGamesPage listOfGamesPage = ListOfGamesPage.fromJson(games);
    List<Game> gameList = Game.getGames(listOfGamesPage);
    return gameList;
  }

  Future<String> loadGameDescription(int gameId) async {
    //  print("entered load game description");
    String url = "$GAME_CARD_PAGE_URL$gameId";
    Response futurePage = await dio.get(url);
    GameCardPageDetails gameCardPageDetails = GameCardPageDetails.fromJson(futurePage.data);
    var descriptionRaw = gameCardPageDetails.descriptionRaw;
    return descriptionRaw;
  }

//  Future<GamePage> loadGameCardPage(int gameId) {
//    String url = "$GAME_CARD_PAGE_URL$gameId";
//    Future<Response> futurePage = dio.get(url);
//    Future<GamePage> futureGameCardPage = futurePage.then((value) {
//      print("checking the value $value");
//      var info = value.data;
//      GameCardPageDetails gameCardPageDetails =
//          GameCardPageDetails.fromJson(info);
//      GamePage gamePage = GamePage(gameCardPageDetails);
//      return gamePage;
//    });
//
//    return futureGameCardPage;
//  }

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
