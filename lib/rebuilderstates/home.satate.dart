import 'package:rawg/client/game.client.dart';
import 'package:rawg/models/game.model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePageState extends StatesRebuilder {
  static HomePageState homePageState = HomePageState();

  bool isLoading = false;
  int pageNumber = 0;
  List<Game> listOfGames = [];

  loadNextPage() {
    print("calling $pageNumber page");
    pageNumber++;
    isLoading = true;
    print("calling $pageNumber page");
    GameClient.instance.loadGamesOnPage(pageNumber).then((value) {
      isLoading = false;
      List<Game> listOfGamePerPage = value;
      listOfGames.addAll(listOfGamePerPage);
      rebuildStates();
    }).catchError((error) {
      isLoading = false;
      print(error);
    });

    rebuildStates();
  }
}
