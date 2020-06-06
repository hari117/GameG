import 'package:flutter/material.dart';
import 'package:rawg/models/userGenarated/game.model.dart';
import 'package:rawg/pages/homepagewidgets/text.widget.dart';

class MetricPoint extends StatelessWidget {
  Game game;

  MetricPoint(this.game);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.green),
      ),
      child: Center(
        child: TextWidget("${game.metaScore}", 10, 10, 0, 0, FontWeight.w400, 17, Colors.white, 1),
      ),
    );
  }
}
