import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/models/userGenarated/game.model.dart';
import 'package:gameg/modules/future_network_image/future.network.image.widget.dart';
import 'package:gameg/pages/homepagewidgets/game.rating.widget.dart';
import 'package:gameg/pages/homepagewidgets/game.store.button.dart';
import 'package:gameg/pages/homepagewidgets/platfrom.icons.widget.dart';
import 'package:gameg/pages/readmore.page.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:url_launcher/url_launcher.dart';

class NewGameDetailsPage extends StatelessWidget {
  fignaTheams fg = fignaTheams();
  HomePageState homeState = HomePageState.homePageState;
  Game game;

  NewGameDetailsPage(this.game);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fg.elevation_01,
      //appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appbar(context),
            gameDetailsTopSection(),
            deviderWidget(),
            ratingsGroup(),
            deviderWidget(),
            aboutSection(context),
            deviderWidget(),
            platfromSection(),
            secondpart(),
          ],
        ),
      ),
    );
  }

  appbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15),
      child: Container(
        height: 40,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: fg.onSurfaceColor_03,
          ),
        ),
      ),
    );
  }

  gameDetailsTopSection() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              headingText(game.name),
              fg.height15(),
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
          padding: const EdgeInsets.only(left: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              fg.height20(),
              bodyText_02("Screenshots"),
              fg.height15(),
              SizedBox(
                height: 65,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: screenhotsList(),
                ),
              ),
              fg.height20(),

            ],
          ),
        ),
      ],
    );
  }

  ratingsGroup() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        children: <Widget>[
          fg.height20(),
          GameRatings(game),
          fg.height20(),
        ],
      ),
    );
  }

  aboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          fg.height20(),
          headingText("About"),
          fg.height15(),
          description(),
          fg.height10(),
          readMoreButton(context),
          fg.height20(),
          headingText("Website"),
          fg.height15(),
          websiteLink(),
          fg.height20(),
        ],
      ),
    );
  }

  platfromSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          fg.height20(),
          headingText("Platforms"),
          fg.height15(),
          showPlatformsAndGenres(game.platform),
          fg.height20(),
          headingText("Genres"),
          fg.height15(),
          showPlatformsAndGenres(game.genres),
          fg.height20(),
          releaseDataAndAgeRating(),
          fg.height20(),
        ],
      ),
    );
  }

  secondpart() {
    return Container(
      width: double.infinity,
      color: fg.surfaceColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            fg.height20(),
            headingText("Devalopers"),
            fg.height15(),
            bodyText_02("NA"),
            fg.height20(),
            headingText("Publishers"),
            fg.height15(),
            bodyText_02("NA"),

            fg.height20(),
            headingText("Where To Buy"),
            fg.height15(),
            StoreButtons(game),
            fg.height20(),
            headingText("Tags"),
            fg.height15(),
            tagsGenerator(game.listOfTags),
            fg.height20(),
          ],
        ),
      ),
    );
  }

  readMoreButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => ReadMoreDescription(game),
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      color: fg.elevation_03,
      child: Text(
        "Read More",
        style: GoogleFonts.roboto(color: fg.onSurfaceColor_02, fontSize: fg.bodyText_02),
      ),
    );
  }

  relaseData() {
    if (game.releaseData == null) {
      return bodyText_02("NA");
    } else {
      return bodyText_02("${DateFormat.yMd().format(game.releaseData)}");
//
    }
  }

  showPlatformsAndGenres(List<String> plat) {
    //  print("${game.stores[0].websiteName}");
    String fullList = "";
    for (int i = 0; i < plat.length; i++) {
      fullList = fullList + plat[i] + "     ";
    }
    return bodyText_02("$fullList");
  }
  tagsGenerator(List<String> plat) {
    //  print("${game.stores[0].websiteName}");
    String fullList = "";
    for (int i = 0; i < plat.length; i++) {
      fullList = fullList + plat[i] + "     ";
    }
    return LT1Text("$fullList");
  }
  websiteLink() {
    return StateBuilder(
        observe: () => homeState,
        builder: (content, _) {
          if (homeState.isDescriptionLoad)
            return bodyText_02(game.website);
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
            return Container(
              height: 100,
              child: bodyText_01(game.description),
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



  releaseDataAndAgeRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        fg.height15(),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                headingText("Release Date"),
                fg.height15(),
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
                headingText("Age Rating"),
                fg.height15(),
                bodyText_02("NA"),

              ],
            ),
          ),
        ),

      ],
    );
  }

  gameCardImagePageview(int index) {
    return FutureNetworkImage(game.name, game.screenShotUrls[index]);
  }

  screenhotsList() {
    List<Widget> list = [];
    for (int i = 0; i < game.screenShotUrls.length; i++) {
      list.add(screenshots(i));
    }
    return list;
  }

  screenshots(int imagePosition) {
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
              padding: EdgeInsets.all(2),
              child: gameCardImagePageview(imagePosition),
            ),
          ),
        );
      },
    );
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



  headingText(String name) {
    return Text(
      name,
      style: GoogleFonts.roboto(color: fg.onSurfaceColor_01, fontSize: fg.H5,height: 1.5,letterSpacing: .5),
    );
  }

  bodyText_01(String name) {
    return Text(
      name,
      style: GoogleFonts.roboto(color: fg.onSurfaceColor_03, fontSize: fg.bodyText_01,letterSpacing: 1.1,height: 1.5),
    );
  }
  bodyText_02(String name) {
    return Text(
      name,
      style: GoogleFonts.roboto(color: fg.onSurfaceColor_03, fontSize: fg.bodyText_02,letterSpacing: 1.3,height: 1.3),
    );
  }
  LT1Text(String name) {
    print("called lt1Text");
    return Text(
      name,
      style: GoogleFonts.roboto(color: fg.onSurfaceColor_03, fontSize: fg.LT1,letterSpacing: 1.7,height: 1.5),
    );
  }
}
