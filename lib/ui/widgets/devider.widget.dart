import 'package:flutter/material.dart';
import 'package:gameg/ui/widgets/theme/app.theme.dart';

class DeviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .1,
      child: Divider(
        thickness: 1,
        color: $appTheme.onSurfaceColor_1,
      ),
    );
  }
}
