import 'package:gameg/client/game.client.dart';
import 'package:gameg/helperfiles/logger.helper.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:logger/logger.dart';

import 'package:states_rebuilder/states_rebuilder.dart';

class HomePageState extends StatesRebuilder {
  static HomePageState homePageState = HomePageState();
  static final Logger _log = getLogger("HomePageState");

  int genresId = 0;
  int pageNumber = 1;
  int relatedGamesPageCount = 1;

  double height = 100;
  String genres;
  String platform;
  String contentIndicator = "Showless..";
  String searchText="";

  bool showHigh = false;
  bool isLoading = false;
  bool isGamePageLoad = false;
  bool isError=false;

  List<Game> listOfGames = [];

  Map<String, int> genresIdGetter = {
    "Action": 4,
    "Strategy": 10,
    "Rpg": 5,
    "Shooter": 2,
    "Adventure": 3,
    "Puzzle": 7,
    //"Arcade":11,
    "Racing": 1,
    "Sports": 15,
  };



  changeContainer(double h, String name) {
    height = h;

    contentIndicator = name;
    rebuildStates();
  }

  loadNextPage() async {
    //  print("calling $pageNumber.0 page");
    isLoading = true;
    rebuildStates();

    print("the searchText is $searchText");
    try {
      var value = await GameClient.instance.loadGamesOnPage(pageNumber, genresId,searchText);
      listOfGames.addAll(value);
      pageNumber++;
    } catch (error) {
      _log.e("Unable to load games page: ${pageNumber}");
      isError=true;
      isLoading=false;

    } finally {
      isLoading = false;
      rebuildStates();
    }
  }


  resetState() {
    listOfGames = [];
    pageNumber = 1;
    genres = null;
    searchText="";
    rebuildStates();
  }

  genresSeter(String genresName) {
    genresId = genresIdGetter[genresName];
    genres = genresName;
    rebuildStates();

  }

  //loading suggested games
  loadGameDetailsPage(Game game) {
    //   print("calling gameID to get description and suggested games");
    isGamePageLoad = false;
    GameClient.instance.getDescriptionAndSuggestedGames(game, relatedGamesPageCount).then((value) {
      isGamePageLoad = true;
      game.description = value[0];
      game.relatedGames = value[1];
      relatedGamesPageCount++;
      //   print("sucessfully displayed description and suggested games on UI");
      rebuildStates();
    });

    rebuildStates();
  }
}
