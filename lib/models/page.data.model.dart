//import 'file:///D:/Workspace/rawg/lib/models/generated/page.json.model.dart';
//
//class ListOfGames {
//  String nextPage;
//  String previousPage;
//
//  List<String> gameNames = List();
//  List<String> backgroundGameImages = List();
//
//  static List<ListOfGames> gameInfo(ListOfGamesPage listOfGamesPage) {
//    List<ListOfGames> games = List();
//
//    List<Result> result = listOfGamesPage.results;
//    for (Result resultObject in result) {
//      ListOfGames list = ListOfGames();
//
//      list.gameNames.add(resultObject.name);
//      list.backgroundGameImages.add(resultObject.backgroundImage);
//
//      games.add(list);
//    }
//    return games;
//  }
//}
