import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/svg.imges.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/ui/page/game_detail_page/tags.generator.dart';
import 'package:gameg/ui/widgets/theme/app.theme.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:gameg/ui/widgets/theme/url.button.widget.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';

class GameDetailBottomSection extends StatelessWidget {
  final Game game;

  GameDetailBottomSection(this.game);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: $appTheme.surfaceColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WhereToBuySection(game),
          TagsGenerator(game),
        ],
      ),
    );
  }
}

class WhereToBuySection extends StatelessWidget {
  Game game;

  WhereToBuySection(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        VS3(),
        PagePadding(child: H5("Where To Buy")),
        VS2(),
        buildStoreButtons(),
        VS3(),
      ],
    );
  }

  Widget buildStoreButtons() {
    List<Widget> list = [];
    list.add(SizedBox(width: 30));
    for (int ii = 0; ii < game.stores.length; ii++) {
      list.add(storeButton(ii));
      list.add(SizedBox(width: 20));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }

  storeButton(int index) {
    var store = game.stores[index];
    String name = store.websiteName;
    String icon = SvgImagesMap.shopIcons[name];
    String website = store.url;
    return UrlButton(icon: icon, text: name, url: website);
  }
}
