import 'file:///D:/Workspace/rawg/lib/client/client.request.model.dart';
import 'package:rawg/models/page.data.model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePageState extends StatesRebuilder {
  static HomePageState homePageState = HomePageState();

  bool isLoading = false;
  ClientRequest clientRequest = ClientRequest();
  List<ListOfGames> allGamesObjects = [];

  loadPage() {
    isLoading = false;
    clientRequest.getPage().then((value) {
      print(value);
      isLoading = true;
      allGamesObjects.addAll(value);
      rebuildStates();
      // print("${value[0].gameNames}");
    });
    rebuildStates();
  }
}
