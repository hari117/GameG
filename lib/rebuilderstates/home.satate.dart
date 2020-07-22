import 'dart:math';

import 'package:gameg/client/game.client.dart';
import 'package:gameg/helperfiles/logger.helper.dart';
import 'package:gameg/models/generated/page.json.model.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:logger/logger.dart';

import 'package:states_rebuilder/states_rebuilder.dart';

class HomePageState extends StatesRebuilder {
  static HomePageState homePageState = HomePageState();
  static final Logger _log = getLogger("HomePageState");

  int genresId = 0;
  int pageNumber = 1;
  int imageBanner=0;
  int relatedGamesPageCount = 1;

  double height = 100;
  String genres;
  String platform;
  String contentIndicator = "Showless..";
  String searchText=null;

  bool showHigh = false;
  bool isLoading = false;
  bool isDescriptionLoad = false;
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




  loadNextPage() async {
    //  print("calling $pageNumber.0 page");
    isLoading = true;
    isError=false;
   // rebuildStates();

    print("the searchText is $searchText");
    try {
      var value = await GameClient.instance.loadGamesOnPage(pageNumber, genresId,searchText);
      listOfGames.addAll(value);
      pageNumber++;

    } catch (error) {
      _log.e("Unable to load games page: ${pageNumber}");

      isLoading=false;
      isError=true;

    } finally {
      isLoading=false;
      isError=false;
      rebuildStates();
    }
  }


  //loading suggested games
  loadDescription(Game game) {
    _log.i("calling loadDescription ");
    _log.i("the isDescriptionLoad value is $isDescriptionLoad ");
    isDescriptionLoad = false;
   // GameClient.instance.getDescriptionAndSuggestedGames(game, relatedGamesPageCount).then((value) {
      GameClient.instance.loadGameDescription(game).then((value) {
      isDescriptionLoad = true;
      _log.i("the isDescriptionLoad value is $isDescriptionLoad ");
      game.description = value[0];
      game.website = value[1];
      if(game.website=="" || game.website==null) {
        game.website = "NA";
      }
      //print(game.description);
     // game.relatedGames = value[1];
  //    relatedGamesPageCount++;
      //   print("sucessfully displayed description and suggested games on UI");
      rebuildStates();
    });

    rebuildStates();
  }



  changeContainer(double h, String name) {
    height = h;

    contentIndicator = name;
    rebuildStates();
  }

  searchbox()
  {
    _log.i("the user search keyword is $searchText");
    listOfGames=[];
    pageNumber=1;
    genres=null;
    loadNextPage();
    searchText="";
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

  imageBannerUpdate(int number)
  {
    imageBanner=number;

    print("************now imageBanner value is $number*************");
    rebuildStates();
  }


}
