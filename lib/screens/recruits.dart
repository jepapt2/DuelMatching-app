import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duel_matching/model/user_profile/user_profile.dart';
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
          child: ElevatedButton(
            child: Text('ダミー'),
            onPressed: () => dammy(),
          ),
        )
      ]),
    ));
  }

  dammy() async {
    for (int i = 0; i < 10; i++) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('testData-${i.toString()}')
          .set({
        'header': '',
        'avatar': '',
        'name': 'test-${i.toString()}',
        'comment': 'test-${i.toString()}',
        'introduction': 'test-${i.toString()}',
        'favorite': 'test-${i.toString()}',
        'playTitle': ['遊戯王'],
        'remoteDuel': true,
        'adress': '東京都',
        'activityDay': 'test-${i.toString()}',
        'activityTime': 'test-${i.toString()}',
        'age': 'test-${i.toString()}',
        'sex': 'test-${i.toString()}',
        'createdAt': DateTime(2022, 1, 1, i),
        'activeAt': DateTime(2022, 1, 1, i),
        'order': i + 30
      });
    }
  }
}
