import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/helperfiles/svg.imges.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';



class StoreButtons extends StatelessWidget {
  Game game;

  StoreButtons(this.game);

  fignaTheams figmaColors = fignaTheams();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: game.stores.length,
          itemBuilder: (_, pos) {
            return storeButton(pos);
          }),
    );
  }
  storeButton(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: RaisedButton(

        splashColor:figmaColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: figmaColors.elevation_01,
        onPressed: () {
          _launchURL(game.stores[index].url);
          // print("url lanched");
        },
        child: Row(
          children: [
            Text(
              game.stores[index].websiteName,
              style: GoogleFonts.roboto(color:figmaColors.onSurfaceColor_03, fontSize: figmaColors.bodyText_02, letterSpacing: 1),
            ),
            storeIconPlacer(game.stores[index].websiteName),
          ],
        ),
      ),
    );
  }

  storeIconPlacer(String storeName) {
//    print("the icon name is ********$storeName*********");
    if (SvgImagesMap.shopIcons.containsKey(storeName))
      return Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
        child: SvgPicture.asset(
          SvgImagesMap.shopIcons['$storeName'],
          width: 30,color: figmaColors.primaryColor,
        ),
      );
    else
      return SizedBox();
  }



  _launchURL(String urlpage) async {
    if (await canLaunch(urlpage)) {
      await launch(urlpage);
    } else {
      throw 'Could not launch $urlpage';
    }
  }

}
