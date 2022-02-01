import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:flutter/material.dart';

class RecruitsScreen extends StatelessWidget {
  const RecruitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
        sliverChild: SliverList(
      delegate: SliverChildListDelegate([
        Container(
          child: Text('recruits'),
        )
      ]),
    ));
  }
}
