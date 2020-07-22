
import 'package:flutter/material.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/pages/homepagewidgets/game.rating.widget.dart';
import 'package:gameg/ui/widgets/devider.widget.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';

class GameRatingsSection extends StatelessWidget {
  Game game;

  GameRatingsSection(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DeviderWidget(),
        VS1(),
        PagePadding(child: GameRatings(game)),
        VS1(),
        DeviderWidget(),
        VS1(),
      ],
    );
  }
}
