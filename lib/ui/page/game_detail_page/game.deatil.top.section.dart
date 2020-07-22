import 'package:flutter/material.dart';
import 'package:gameg/client/game.client.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/modules/future_network_image/future.network.image.widget.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:gameg/ui/widgets/platfrom.icons.widget.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class GameDetailTopSection extends StatelessWidget {
  final Game game;
  final HomePageState homeState = HomePageState.homePageState;

  GameDetailTopSection(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PagePadding(child: MB1(child: H5(game.name))),
        PagePadding(child: MB2(child: PlatformIconsWidget(game))),
        imageView(),
      ],
    );
  }

  Widget imageView() {
    List<Widget> selectableImageWidgets = [];
    selectableImageWidgets.add(MLPS());
    for (int ii = 0; ii < game.screenShotUrls.length; ii++) {
      selectableImageWidgets.add(ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          child: Container(
            padding: EdgeInsets.all(2),
            child: FutureNetworkImage(game.name, game.screenShotUrls[ii]),
          ),
        ),
      ));
    }

    return StateBuilder(
      observe: () => homeState,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
              child: FutureNetworkImage(game.name, game.screenShotUrls[0]),
            ),
            VS3(),
            PagePadding(child: BT1("Screenshots")),
            VS2(),
            SizedBox(
              height: 80,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: selectableImageWidgets,
              ),
            ),
            VS2(),
          ],
        );
      },
    );
  }
}
