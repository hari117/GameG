import 'package:dio/dio.dart';
import 'package:rawg/models/page.data.model.dart';
import 'package:rawg/models/page.json.model.dart';

class ClientRequest {
  Dio dio = Dio();

  Future<List<ListOfGames>> getPage() {
    Future<Response> futurePage =
        dio.get("https://api.rawg.io/api/games?page=1 ");
    Future<List<ListOfGames>> futureGamePage = futurePage.then((value) {
      var pageInfo = value.data;
      ListOfGamesPage listOfGamesPage = ListOfGamesPage.fromJson(pageInfo);
      List<ListOfGames> gamePage = ListOfGames.gameInfo(listOfGamesPage);
      return gamePage;
    });
    return futureGamePage;
  }
}
