import 'package:logger/logger.dart';
import 'package:rawg/client/game.client.dart';
import 'package:rawg/helperfiles/logger.helper.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePageState extends StatesRebuilder {
  static HomePageState homePageState = HomePageState();
  static final Logger _log = getLogger("HomePageState");

  String genres;
  String platform;

  int pageNumber = 1;
  bool isLoading = false;
  bool isGamePageLoad = false;
  List<Game> listOfGames = [];
  String contentIndicator = "showless..";
  bool showHigh = false;
  double height = 100;
  int relatedGamesPageCount = 1;

  changeContainer(double h, String name) {
    height = h;

    contentIndicator = name;
    rebuildStates();
  }

  loadNextPage() async {
    print("calling $pageNumber.0 page");
    isLoading = true;
    rebuildStates();
    print("isloading $isLoading");
    try {
      var value = await GameClient.instance.loadGamesOnPage(pageNumber, genres);
      listOfGames.addAll(value);
      pageNumber++;
    } catch (e, st) {
      _log.e("Unable to load games page: ${pageNumber}");
      print(st);
    } finally {
      isLoading = false;
      rebuildStates();
    }
  }

  resetState() {
    listOfGames = [];
    pageNumber = 1;
    genres = null;
    rebuildStates();
  }

  genresSeter(String name) {
    genres = name;
    rebuildStates();
  }

  //loading suggested games
  loadGameDetailsPage(Game game) {
    print("calling gameID to get description and suggested games");
    isGamePageLoad = false;
    GameClient.instance.getDescriptionAndSuggestedGames(game, relatedGamesPageCount).then((value) {
      isGamePageLoad = true;
      game.description = value[0];
      game.relatedGames = value[1];
      relatedGamesPageCount++;
      print("sucessfully displayed description and suggested games on UI");
      rebuildStates();
    });

    rebuildStates();
  }
}
