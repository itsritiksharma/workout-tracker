import 'package:flutter/material.dart';

class CardWithList extends StatelessWidget {
  String? title;
  int? reps;
  int? pr;

  CardWithList({@required this.title, @required this.reps, this.pr});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Card(
          elevation: 5,
          // child: Column(
          //   children: [
          // Text(title.toString()),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(title.toString()),
                ),
              );
            },
            itemCount: 4,
          )
          // ],
          // ),

          ),
    );
  }
}
