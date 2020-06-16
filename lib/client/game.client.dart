import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:rawg/helperfiles/logger.helper.dart';
import 'package:rawg/models/generated/gamecardpage.json.model.dart';
import 'package:rawg/models/generated/page.json.model.dart';
import 'package:rawg/models/userGenarated/game.model.dart';

class GameClient {
  static final GameClient instance = GameClient();
  static final Logger _log = getLogger("GameClient");

  final String GAME_RESOURCE_URL = "https://api.rawg.io/api/games";

  final Dio dio = Dio();

  Future<List<Game>> loadGamesOnPage(int pageNumber, String genre) async {
    Map<String, dynamic> queryParameters = {};
    if (genre != null) {
      queryParameters.putIfAbsent("genres", () => genre);
    }
    queryParameters.putIfAbsent("page", () => pageNumber);
    queryParameters.putIfAbsent("page_size", () => 40);

//    _log.i("loading list of games for page number ${pageNumber} with params $queryParameters}");
    Response response = await dio.get(GAME_RESOURCE_URL, queryParameters: queryParameters);
    //_log.d("got response from rest url: $GAME_RESOURCE_URL");
//    _log.d("response data: ${response.data}");
    ListOfGamesPage listOfGamesPage = ListOfGamesPage.fromJson(response.data);
    List<Game> gameList = Game.getGamesFrom(listOfGamesPage);
//    _log.i("received ${gameList.length} games from rest url");
    return gameList;
  }

  Future getDescriptionAndSuggestedGames(Game game, int suggestionPageNum) async {
//    _log.i("loading game description for game: ${game.gameId}");
    String description = await loadGameDescription(game);

//    _log.i("loading game suggestion for game: ${game.gameId} at pageNum: ${suggestionPageNum}");
    List<Game> suggested = await suggestRelatedGames(game.gameId, suggestionPageNum);
    return Future.value([description, suggested]);
  }

  Future suggestRelatedGames(int gameId, int pageNum) async {
    Map<String, dynamic> queryParameters = {
      "page": pageNum,
      "page_size": 40,
    };

    String url = "$GAME_RESOURCE_URL/$gameId/suggested";
    Response response = await dio.get(url, queryParameters: queryParameters);
    var games = response.data;
    ListOfGamesPage listOfGamesPage = ListOfGamesPage.fromJson(games);
    List<Game> gameList = Game.getGamesFrom(listOfGamesPage);
//    _log.i("receved game suggestion for game: ${gameId} at pageNum: ${pageNum}. no of suggestion: ${gameList.length}");
    return gameList;
  }

  Future<String> loadGameDescription(Game game) async {
    if (game.description != null || game.description != "") return game.description;

    String url = "$GAME_RESOURCE_URL/${game.gameId}";
    Response futurePage = await dio.get(url);
    GameCardPageDetails gameCardPageDetails = GameCardPageDetails.fromJson(futurePage.data);
    var descriptionRaw = gameCardPageDetails.descriptionRaw;
    return descriptionRaw;
  }
}
