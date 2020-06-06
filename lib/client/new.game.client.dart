//import 'package:dio/dio.dart';
//import 'package:rawg/models/generated/gamecardpage.json.model.dart';
//import 'package:rawg/models/generated/page.json.model.dart';
//import 'package:rawg/models/userGenarated/game.model.dart';
//import 'package:rawg/models/userGenarated/gamecardpage.model.dart';
//
//class NewGameClient {
//  static final NewGameClient instance = NewGameClient();
//
//  final String LIST_OF_GAMES_URL = "https://api.rawg.io/api/games?page=";
//  final String GAME_CARD_PAGE_URL = "https://api.rawg.io/api/games/";
//  final Dio dio = Dio();
//
//  Future<List<Game>> loadGamesOnPage(int pageNumber) {}
//
//  Future<List<Game>> suggerstRelatedGames(int gameId) {}
//
//  Future<GamePage> loadGameCardPage(int gameId) {
//    String url = "https://api.rawg.io/api/games/$gameId/suggested";
//    Future<Response> futurePage1 = dio.get(url);
//    futurePage1.then((value) => {});
//
//    Future<Response> futurePage2 = dio.get(url);
//    futurePage2.then((value) => {});
//
//    Future combinedFuture = Future.wait([futurePage1, futurePage2]);
//  }
//}
