import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/helperfiles/svg.imges.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/ui/widgets/theme/url.button.widget.dart';

class StoreButtons extends StatelessWidget {
  Game game;

  StoreButtons(this.game);

  fignaTheams figmaColors = fignaTheams();

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int ii = 0; ii < game.stores.length; ii++) {
      list.add(storeButton(ii));
      list.add(SizedBox(width: 20));
    }

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: game.stores.length,
        itemBuilder: (_, pos) {
          return storeButton(pos);
        });
  }

  storeButton(int index) {
    var store = game.stores[index];

    String name = store.websiteName;
    String icon = SvgImagesMap.shopIcons[name];
    String website = store.url;

    return UrlButton(icon: icon, text: name, url: website);
  }
}
