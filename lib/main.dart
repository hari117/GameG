import 'package:flutter/material.dart';
import 'package:gameg/pages/home.page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';


void main() {
  Logger.level = Level.info;
  runApp(RAWG());
}

class RAWG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),

 );
  }
}
