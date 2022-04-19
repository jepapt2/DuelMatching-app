import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/parts/primary_buttomnavigattionbar.dart';
import 'package:duel_matching/parts/primary_drawer.dart';
import 'package:duel_matching/parts/primary_sliverappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryScaffold extends StatelessWidget {
  const PrimaryScaffold(
      {Key? key,
      required this.child,
      required this.user,
      this.appBarText,
      this.floatingActionButton})
      : super(key: key);

  final dynamic child;
  final Profile user;
  final String? appBarText;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      drawer: const PrimaryDrawer(),
      bottomNavigationBar: const PrimaryButtomNavigationBar(),
      floatingActionButton: floatingActionButton,
    );
  }
}
