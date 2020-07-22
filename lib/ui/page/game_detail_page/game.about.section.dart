import 'package:flutter/material.dart';
import 'package:gameg/client/game.client.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/pages/readmore.page.dart';
import 'package:gameg/ui/widgets/devider.widget.dart';
import 'package:gameg/ui/widgets/theme/app.theme.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';

class GameDetailAboutSection extends StatelessWidget {
  final Game game;

  GameDetailAboutSection(this.game);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GameClient.instance.loadGameDescription(game),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return MT3(child: MB3(child: Center(child: CircularProgressIndicator())));
          default:
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return buildWidget(context);
        }
      },
    );
  }

  Widget buildWidget(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          H5("About"),
          VS2(),
          BT1(game.description, overflow: TextOverflow.ellipsis, maxLines: 5),
          VS1(),
          readMoreButton(context),
          VS3(),
          H5("Website"),
          VS2(),
          BT2(game.website),
          VS3(),
        ],
      ),
    );
  }

  readMoreButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => ReadMoreDescriptionPage(game),
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      color: $appTheme.elevation_3,
      child: BT2("Read More"),
    );
  }
}
