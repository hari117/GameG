import 'package:rawg/client/game.client.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:rawg/models/userGenarated/gamecardpage.model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePageState extends StatesRebuilder {
  static HomePageState homePageState = HomePageState();

  int pageNumber = 1;
  bool isFristTimeCheck = true;
  bool isLoading = false;
  bool isGamePageLoad = false;
  List<Game> listOfGames = [];
  GamePage gameCardPage;
  String contentIndicator = "showless..";
  bool showHigh = false;
  double height = 100;

  changeContainer(double h, String name) {
    height = h;

    contentIndicator = name;
    rebuildStates();
  }

  loadNextPage() {
    print("calling $pageNumber.0 page");
    if (isFristTimeCheck) {
      isLoading = true;
    }

    GameClient.instance.loadGamesOnPage(pageNumber).then((value) {
      isLoading = false;
      List<Game> listOfGamePerPage = value;
      //  print(("list of games length before call ${listOfGames.length}"));
      listOfGames.addAll(listOfGamePerPage);
      //  print(("list of games length after call ${listOfGames.length}"));

      rebuildStates();
    }).catchError((error) {
      isLoading = false;
      print(error);
    });
    pageNumber++;
    rebuildStates();
    isFristTimeCheck = false;
  }

  loadGameCardPage(int gameId) {
    isGamePageLoad = false;
    GameClient.instance.loadGameCardPage(gameId).then((value) {
      isGamePageLoad = true;
      gameCardPage = value;
      print("check tha gamecard page ${gameCardPage.gameDescription}");
      rebuildStates();
    });
    rebuildStates();
  }
}
