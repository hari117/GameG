import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/rebuilderstates/home.satate.dart';
import 'package:gameg/ui/widgets/theme/app.theme.dart';
import 'package:gameg/ui/widgets/theme/util.widgets.theme.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controller = new TextEditingController();
  HomePageState homeState = HomePageState.homePageState;
  fignaTheams figmaColors = fignaTheams();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Container(
    //  width: 250,
      height: 40,
      child: StateBuilder(
        observe: () => homeState,
        builder: (context, _) {
          return TextField(
            controller: _controller,
          //  autofocus:false,
            style: TextStyle(color: figmaColors.onSurfaceColor_01),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              //search icon
              suffix: InkWell(
                onTap: () {
                  homeState.searchbox();
                },
                child: SvgPicture.asset("Assets/interfaceicons/Search_Icon.svg"),
              ),

              labelStyle: TextStyle(color: figmaColors.onSurfaceColor_01),
              hintText: "Search Your Game Here ",
              hintStyle: TextStyle(
                color: figmaColors.onSurfaceColor_03,
                fontSize: $appTheme.lt_1
                ,
              ),
              filled: true,
              fillColor: $appTheme.elevation_3,
              // enabled: false,
              focusedBorder: new UnderlineInputBorder(
                borderSide: new BorderSide(color: figmaColors.elevation_03),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: figmaColors.elevation_03),
              ),
            ),
            cursorColor: figmaColors.onSurfaceColor_03,

            onChanged: (value) {
              homeState.searchText = value;
              print("textfeild value is ${homeState.searchText}");
            },
          );
        },
      ),
    );
  }
}
