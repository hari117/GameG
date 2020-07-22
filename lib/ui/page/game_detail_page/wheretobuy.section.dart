import 'package:flutter/material.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/pages/homepagewidgets/game.store.button.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';

class WhereToBuySection extends StatelessWidget {
  Game game;

  WhereToBuySection(this.game);

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VS3(),
          H5("Where To Buy"),
          VS2(),
          StoreButtons(game),
          VS3(),
        ],
      ),
    );
  }
}
