import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/pages/homepagewidgets/game.rating.widget.dart';
import 'package:gameg/pages/homepagewidgets/platfrom.icons.widget.dart';
import 'package:google_fonts/google_fonts.dart';




class ReadMoreDescription extends StatelessWidget {
  FigmaColors figmaColors = FigmaColors();
  Game game;
  ReadMoreDescription(this.game);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: figmaColors.elevation_01 ,
        elevation: 0,
        leading:   Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: figmaColors.onSurfaceColor_03,
            ),
          ),
        ) ,
      ),
      backgroundColor: figmaColors.elevation_01 ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                height: 20,
              ),
              Text(game.name,style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02,fontSize: figmaColors.H5),),
              SizedBox(
                height: 15,
              ),
              PlatformIconsWidget(game),
              SizedBox(
                height: 25,
              ),
              Text("About",style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02,fontSize: figmaColors.H5),),
              SizedBox(
                height: 20,
              ),
              Text(game.description,style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03,fontSize: figmaColors.bodyText_02,letterSpacing: 1,height: 1.4),),
            ],
          ),
        ),
      ),
    );
  }


}
