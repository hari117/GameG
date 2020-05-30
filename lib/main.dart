import 'package:flutter/material.dart';
import 'package:rawg/pages/home.page.dart';

void main() {
  runApp(RAWG());
}

class RAWG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
