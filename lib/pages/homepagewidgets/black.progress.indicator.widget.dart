import 'package:flutter/material.dart';
import 'package:gameg/helperfiles/figma.colors.dart';
import 'package:gameg/ui/widgets/theme/app.theme.dart';

class BlueProgressIndicatorWidget extends StatelessWidget {
  fignaTheams figmaColors = fignaTheams();
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: $appTheme.primaryColor,
      valueColor: AlwaysStoppedAnimation<Color>($appTheme.surfaceColor),
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