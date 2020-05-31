import 'package:rawg/client/game.client.dart';
import 'package:rawg/models/game.model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePageState extends StatesRebuilder {
  static HomePageState homePageState = HomePageState();

  bool isLoading = false;
  int pageNumber = 1;
  bool isFristTimeCheck = true;
  List<Game> listOfGames = [];

  loadNextPage() {
    print("calling $pageNumber.0 page");
    if (isFristTimeCheck) {
      isLoading = true;
    }

    GameClient.instance.loadGamesOnPage(pageNumber).then((value) {
      isLoading = false;
      List<Game> listOfGamePerPage = value;
      print(("list of games length before call ${listOfGames.length}"));
      listOfGames.addAll(listOfGamePerPage);
      print(("list of games length after call ${listOfGames.length}"));

      rebuildStates();
    }).catchError((error) {
      isLoading = false;
      print(error);
    });
    pageNumber++;
    rebuildStates();
    isFristTimeCheck = false;
  }

  void call() {}
}
