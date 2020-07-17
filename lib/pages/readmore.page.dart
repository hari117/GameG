import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/pages/homepagewidgets/game.rating.widget.dart';
import 'package:gameg/pages/homepagewidgets/platfrom.icons.widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadMoreDescription extends StatelessWidget {
  fignaTheams fg = fignaTheams();
  Game game;

  ReadMoreDescription(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fg.elevation_01,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appbar(context),
              fg.height20(),
              Text(
                game.name,
                style: GoogleFonts.roboto(color: fg.onSurfaceColor_02, fontSize: fg.H5),
              ),
              fg.height15(),
              PlatformIconsWidget(game),
              fg.height25(),
              Text(
                "About",
                style: GoogleFonts.roboto(color: fg.onSurfaceColor_02, fontSize: fg.H5),
              ),
              fg.height20(),
              bodyText_01(game.description),
              fg.height20(),
            ],
          ),
        ),
      ),
    );
  }

  bodyText_01(String name) {
    return Text(
      name,
      style: GoogleFonts.roboto(color: fg.onSurfaceColor_03, fontSize: fg.bodyText_01, letterSpacing: 1.1, height: 1.5),
    );
  }

  appbar(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: fg.onSurfaceColor_03,
      ),
    );
  }
}
