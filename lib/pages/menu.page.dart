import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawg/rebuilderstates/home.satate.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MenuOptions extends StatefulWidget {
  @override
  _MenuOptionsState createState() => _MenuOptionsState();
}

class _MenuOptionsState extends State<MenuOptions> {
  HomePageState menuState = HomePageState.homePageState;
  List<String> genres = ["Action", "Strategy", "RPG", "Shooter", "Adventure", "Puzzle", "Racing", "Sports"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: StateBuilder(
          observe: () => menuState,
          builder: (con, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 90),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              genresSection("Action", context),
                  sizeBox(),
              genresSection("Strategy", context),
                  sizeBox(),
              genresSection("Rpg", context),
                  sizeBox(),
              genresSection("Shooter", context),
                  sizeBox(),
              genresSection("Adventure", context),
                  sizeBox(),
              genresSection("Puzzle", context),
                  sizeBox(),
              //    genresSection("Arcade", context),
               //   genresSection("Rpg", context),
              genresSection("Sports", context),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: floatingButton(),
    );
  }

  genresSection(String name, BuildContext context) {

    return InkWell(
      onTap: () {
        menuState.resetState();
        menuState.genresSeter(name);
        menuState.loadNextPage();
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: <Widget>[
            Image(
              width: 30,
              height: 30,
              image: AssetImage("Assets/genresicons/$name.png",),
            ),
            SizedBox(width: 10,),
            Text(name, style: GoogleFonts.roboto(color: Colors.white, fontSize: 30,letterSpacing: 2),
            ),
          ],

        ),
      ),
    );
  }

  sizeBox()
  {
    return SizedBox(height: 10,);
  }
  floatingButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 180,vertical: 120),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.clear,
            color: Colors.black,
            size: 40,
          ),
        ),
      ),
    );
  }
}
