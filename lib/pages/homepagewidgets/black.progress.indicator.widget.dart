import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';

class BlueProgressIndicatorWidget extends StatelessWidget {
  fignaTheams figmaColors = fignaTheams();
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: figmaColors.primaryColor,
      valueColor: AlwaysStoppedAnimation<Color>(figmaColors.elevation_03),
    );
  }
}

class EmptyBlueProgressIndicatorWidget extends StatelessWidget {
  fignaTheams figmaColors = fignaTheams();
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}