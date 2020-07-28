import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';

class TagsGenerator extends StatelessWidget {
  Game game;

  TagsGenerator(this.game);

  @override
  Widget build(BuildContext context) {
    String fullList = "";
    for (int i = 0; i < game.listOfTags.length; i++) {
      fullList = fullList + game.listOfTags[i] + "        ";
    }
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          H5("Tags"),
          VS2(),
          LT1("$fullList"),
          VS3(),
        ],
      ),
    );
  }
}
