import 'package:duel_matching/model/user_profile/user_profile.dart';
import 'package:duel_matching/parts/primary_buttomnavigattionbar.dart';
import 'package:duel_matching/parts/primary_drawer.dart';
import 'package:duel_matching/parts/primary_sliverappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryScaffold extends StatelessWidget {
  const PrimaryScaffold(
      {Key? key,
      required this.sliverChild,
      required this.user,
      this.appBarText,
      this.appBarAction,
      this.floatingActionButton})
      : super(key: key);

  final Widget sliverChild;
  final Profile user;
  final String? appBarText;
  final List<Widget>? appBarAction;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          PrimarySliverAppBar(
            user: user,
            appBarText: appBarText,
            appBarAction: appBarAction,
          ),
          sliverChild,
        ],
      ),
      drawer: PrimaryDrawer(),
      bottomNavigationBar: const PrimaryButtomNavigationBar(),
      floatingActionButton: floatingActionButton,
    );
  }
}
