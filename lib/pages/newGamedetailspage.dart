import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/helperfiles/svg.imges.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/modules/future_network_image/future.network.image.widget.dart';
import 'package:gameg/pages/homepagewidgets/game.rating.widget.dart';
import 'package:gameg/pages/homepagewidgets/platfrom.icons.widget.dart';
import 'package:gameg/pages/readmore.page.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:url_launcher/url_launcher.dart';

class NewGameDetailsPage extends StatelessWidget {
  FigmaColors figmaColors = FigmaColors();
  HomePageState homeState = HomePageState.homePageState;
  Game game;

  NewGameDetailsPage(this.game);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: figmaColors.elevation_01,
      //appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15),
              child: Container(
                height: 40,

                //         color: Colors.red,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: figmaColors.onSurfaceColor_03,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${game.name}",
                    style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PlatformIconsWidget(game),
                ],
              ),
            ),
            StateBuilder(
              observe: () => homeState,
              builder: (context, _) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  child: gameCardImagePageview(homeState.imageBanner),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: Text(
                "Screenshots",
                style: GoogleFonts.roboto(fontSize: figmaColors.bodyText_02, color: figmaColors.onSurfaceColor_01, height: 1, letterSpacing: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 30),
              child: SizedBox(
                height: 65,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: imagesList(),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            deviderWidget(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: GameRatings(game),
            ),
            SizedBox(
              height: 20,
            ),
            deviderWidget(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "About",
                style: GoogleFonts.roboto(
                  fontSize: figmaColors.H5,
                  color: figmaColors.onSurfaceColor_02,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            description(),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => ReadMoreDescription(game),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                color: figmaColors.elevation_03,
                child: Text(
                  "Read More",
                  style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.bodyText_02),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Website",
                style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Website(),
            SizedBox(
              height: 20,
            ),
            deviderWidget(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Platforms",
                style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: showPlatformsAndGenres(game.platform),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Genres",
                style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: showPlatformsAndGenres(game.genres),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Release Date",
                            style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          relaseData(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Age Rating",
                            style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("NA",
                              style: GoogleFonts.roboto(
                                  color: figmaColors.onSurfaceColor_03, fontSize: figmaColors.bodyText_02, letterSpacing: 1, height: 1.4)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              width: double.infinity,
              color: figmaColors.surfaceColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Developers",
                      style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "NA",
                      style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03, fontSize: figmaColors.bodyText_02, letterSpacing: 1, height: 1.4),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Publisher",
                      style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "NA",
                      style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03, fontSize: figmaColors.bodyText_02, letterSpacing: 1, height: 1.4),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Where to Buy",
                      style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    storeBuilder(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tags",
                      style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_02, fontSize: figmaColors.H5),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    showPlatformsAndGenres(game.listOfTags),
                    SizedBox(
                      height: 30,
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  storeBuilder() {
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



  relaseData() {
    if (game.releaseData == null) {
      return Text("NA");
    } else {
      return Text("${DateFormat.yMd().format(game.releaseData)}",
          style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03, fontSize: figmaColors.bodyText_02, letterSpacing: 1, height: 1.4));
    }
  }

  showPlatformsAndGenres(List<String> plat) {
    //  print("${game.stores[0].websiteName}");
    String fullList = "";
    for (int i = 0; i < plat.length; i++) {
      fullList = fullList + plat[i] + "     ";
    }
    return Text("$fullList",
        style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03, fontSize: figmaColors.bodyText_02, letterSpacing: 1, height: 1.4));
  }

  Website() {
    return StateBuilder(
        observe: () => homeState,
        builder: (content, _) {
          if (homeState.isDescriptionLoad)
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                game.website,
                style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03, fontSize: figmaColors.bodyText_02, letterSpacing: 1, height: 1.4),
              ),
            );
          if (!homeState.isDescriptionLoad)
            return Center(
              child: SizedBox(),
            );
        });
  }

  description() {
    return StateBuilder(
        observe: () => homeState,
        builder: (content, _) {
          if (homeState.isDescriptionLoad)
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 119,
                child: Text(
                  game.description,
                  style: GoogleFonts.roboto(color: figmaColors.onSurfaceColor_03, fontSize: figmaColors.bodyText_02, letterSpacing: 1, height: 1.4),
                ),
              ),
            );
          if (!homeState.isDescriptionLoad)
            return Container(
              //     color: Colors.red,
              width: double.infinity,
              height: 100,
              child: Center(
                child: SizedBox(),
              ),
            );
        });
  }

  deviderWidget() {
    return Opacity(
      opacity: .1,
      child: Divider(
        thickness: 1,
        color: Colors.white,
      ),
    );
  }

  appbar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.push;
        },
        icon: Icon(
          Icons.arrow_back,
          color: figmaColors.onSurfaceColor_03,
        ),
      ),
      backgroundColor: figmaColors.elevation_01,
    );
  }

  gameCardImagePageview(int index) {
    print("image position $index");
    return FutureNetworkImage(game.name, game.screenShotUrls[index]);
  }

  imagesList() {
    List<Widget> list = [];
    for (int i = 0; i < game.screenShotUrls.length; i++) {
      list.add(downloadImage(i));
    }
    return list;
  }

  downloadImage(int imagePosition) {
    return StateBuilder(
      observe: () => homeState,
      builder: (context, _) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            onTap: () {
              homeState.imageBannerUpdate(imagePosition);
            },
            child: Container(
              padding: EdgeInsets.all(3),
              child: gameCardImagePageview(imagePosition),
            ),
          ),
        );
      },
    );
  }
}
