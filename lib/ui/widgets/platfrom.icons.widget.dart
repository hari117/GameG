import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gameg/helperfiles/svg.imges.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gameg/models/generated/page.json.model.dart';


class PlatformIconsWidget extends StatelessWidget {
  Game game;

  PlatformIconsWidget(this.game);

  @override
  Widget build(BuildContext context) {
    return suppportedPlatformWidget();
  }

  suppportedPlatformWidget() {
    List<Widget> svg = List();
    for (int i = 0; i < game.parentPlatform.length; i++) {
      svg.add(platformIconWidgetFor(game.parentPlatform[i]));
      svg.add(
        SizedBox(
          width: 15,
        ),
      );
    }
    return Row(
      children: svg,
    );
  }

  Widget platformIconWidgetFor(PlatformName platformName) {
    if (SvgImagesMap.platformIcons.containsKey(platformName)) {
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: SvgPicture.asset(SvgImagesMap.platformIcons[platformName]),
      );
    } else {
      return SizedBox();
    }
    //if (platformName)
  }
}
