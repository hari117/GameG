//import 'package:rawg/client/game.client.dart';
//import 'package:rawg/models/userGenarated/game.model.dart';
//import 'package:states_rebuilder/states_rebuilder.dart';
//
//import 'home.satate.dart';
//
//class GameDetailsPageState extends StatesRebuilder {
//  HomePageState detailsPage = HomePageState.homePageState;
//  bool isGamePageLoad = false;
//
//  loadGameDetailsPage(Game game) {
//    print("calling gameID to get description and suggested games");
//    isGamePageLoad = false;
//    GameClient.instance.GameID(game).then((value) {
//      isGamePageLoad = true;
//      game.description = value[0];
//      game.relatedGames = value[1];
//      print("sucessfully displayed description and suggested games on UI");
//      rebuildStates();
//    });
//
//    rebuildStates();
//  }
//}
