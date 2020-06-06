import 'package:rawg/client/game.client.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePageState extends StatesRebuilder {
  static HomePageState homePageState = HomePageState();

  int pageNumber = 1;
  bool isFristTimeCheck = true;
  bool isLoading = false;
  bool isGamePageLoad = false;
  List<Game> listOfGames = [];
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

    //loading page
    GameClient.instance.loadGamesOnPage(pageNumber).then((value) {
      isLoading = false;
      List<Game> listOfGamePerPage = value;
      //  print(("list of games length before call ${listOfGames.length}"));
      listOfGames.addAll(listOfGamePerPage);
      //  print(("list of games length after call ${listOfGames.length}"));

      rebuildStates();
    }).catchError((error) {
      isLoading = false;
      print("the errror is $error");
    });
    pageNumber++;
    rebuildStates();
    isFristTimeCheck = false;
  }

  //loading suggested games
  loadGameDetailsPage(Game game) {
    print("calling gameID to get description and suggested games");
    isGamePageLoad = false;
    GameClient.instance.GameID(game).then((value) {
      isGamePageLoad = true;
      game.description = value[0];
      game.relatedGames = value[1];
      print("sucessfully displayed description and suggested games on UI");
      rebuildStates();
    });

    rebuildStates();
  }
}
