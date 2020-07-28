import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/pages/homepagewidgets/game.rating.widget.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';
import 'file:///D:/Flutter%20Apps/RealTimeApps/gameg/lib/ui/widgets/platfrom.icons.widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadMoreDescriptionPage extends StatelessWidget {
  fignaTheams fg = fignaTheams();
  Game game;

  ReadMoreDescriptionPage(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fg.elevation_01,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            VS3(),
            VS2(),
            appbar(context),
            bodyContainer(),
          ],
        ),
      ),
    );
  }

  appbar(BuildContext context) {
    return PagePadding(
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: SvgPicture.asset("Assets/interfaceicons/Back_Icon.svg"),
      ),
    );
  }

  bodyContainer() {
    return PagePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VS3(),
          VS2(),
          H5(game.name),
          VS2(),
          PlatformIconsWidget(game),
          VS3(),
          H5("About"),
          VS3(),
          BT1(game.description),
          VS3(),
        ],
      ),
    );
  }
}
