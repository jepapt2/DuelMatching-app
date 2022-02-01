import 'package:duel_matching/parts/primary_scaffold.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
        sliverChild: SliverList(
      delegate: SliverChildListDelegate([
        Container(
          child: Text('notice'),
        )
      ]),
    ));
  }
}
