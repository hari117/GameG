import 'package:flutter/material.dart';
import 'package:gameg/ui/widgets/theme/app.theme.dart';
import 'package:google_fonts/google_fonts.dart';

class H1 extends StatelessWidget {
  String text;

  H1(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_0,
        fontSize: $appTheme.H1,
      ),
    );
  }
}

class H2 extends StatelessWidget {
  String text;

  H2(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_0,
        fontSize: $appTheme.H2,
      ),
    );
  }
}

class H3 extends StatelessWidget {
  String text;

  H3(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_0,
        fontSize: $appTheme.H3,
      ),
    );
  }
}

class H4 extends StatelessWidget {
  String text;

  H4(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_0,
        fontSize: $appTheme.H4,
      ),
    );
  }
}

class H5 extends StatelessWidget {
  String text;

  H5(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_0,
        fontSize: $appTheme.H5,
      ),
    );
  }
}

class H6 extends StatelessWidget {
  String text;

  H6(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_0,
        fontSize: $appTheme.bt_1,
      ),
    );
  }
}

class BT1 extends StatelessWidget {
  String text;
  TextOverflow overflow;
  int maxLines;
  double lineHeight;

  BT1(this.text, {this.overflow, this.maxLines, this.lineHeight});

  @override
  Widget build(BuildContext context) {
    if (lineHeight == null) {
      lineHeight = $appTheme.lh_1;
    }
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_1,
        fontSize: $appTheme.bt_1,
        height: lineHeight,
        letterSpacing: 0.8,
      ),
    );
  }
}

class BT2 extends StatelessWidget {
  String text;
  TextOverflow overflow;
  int maxLines;
  double lineHeight;

  BT2(this.text, {this.overflow, this.maxLines, this.lineHeight});

  @override
  Widget build(BuildContext context) {
    if (lineHeight == null) {
      lineHeight = $appTheme.lh_2;
    }
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_2,
        fontSize: $appTheme.bt_2,
        height: lineHeight,
      ),
    );
  }
}

class LT1 extends StatelessWidget {
  String text;
  double lineHeight;

  LT1(this.text, {this.lineHeight});

  @override
  Widget build(BuildContext context) {
    if (lineHeight == null) {
      lineHeight = $appTheme.lh_3;
    }

    return Text(
      text,
      style: GoogleFonts.roboto(
        color: $appTheme.onSurfaceColor_3,
        fontSize: $appTheme.lt_1,
        height: lineHeight,
      ),
    );
  }
}
