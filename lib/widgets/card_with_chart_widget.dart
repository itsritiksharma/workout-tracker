import 'package:flutter/material.dart';
import './chart_widget.dart';

class CardWithChart extends StatelessWidget {
  String? title;
  int? reps;
  int? pr;

  CardWithChart({@required this.title, @required this.reps, this.pr});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Column(
          children: [Text(title.toString()), Chart()],
        ),
      ),
    );
  }
}
