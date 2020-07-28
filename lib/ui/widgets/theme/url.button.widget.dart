import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameg/ui/widgets/theme/app.theme.dart';
import 'package:gameg/ui/widgets/theme/text.theme.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlButton extends StatelessWidget {
  String text;
  String icon;
  String url;

  UrlButton({this.text, this.icon, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        splashColor: $appTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: $appTheme.elevation_1,
        onPressed: () {
          launchURL(url);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 18,
                color: $appTheme.primaryColor,
              ),
              SizedBox(width: 10),
              BT2(text),
            ],
          ),
        ),
      ),
    );
  }
}

class UrlFlatButton extends StatelessWidget {
  String url;

  UrlFlatButton({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: FlatButton(
        splashColor: $appTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: $appTheme.elevation_1,
        onPressed: () {
          launchURL(url);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: BT2(url),
        ),
      ),
    );
  }
}

launchURL(String urlpage) async {
  if (await canLaunch(urlpage)) {
    await launch(urlpage);
  } else {
    throw 'Could not launch $urlpage';
  }
}
