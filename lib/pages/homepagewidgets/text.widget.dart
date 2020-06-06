import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextWidget(
  String content,
  double topPadding,
  double bottomPadding,
  double leftPadding,
  double rightPadding,
  FontWeight weight,
  double size,
  Color color,
  double letterspace,
) {
  return Padding(
    padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding, left: leftPadding, right: rightPadding),
    child: Text(
      content,
      style: GoogleFonts.roboto(color: color, fontSize: size, fontWeight: weight, letterSpacing: letterspace),
      textAlign: TextAlign.center,
    ),
  );
}
