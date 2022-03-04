import 'package:duel_matching/parts/primary_buttonnavigattionbar.dart';
import 'package:duel_matching/parts/primary_drawer.dart';
import 'package:duel_matching/parts/primary_sliverappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryScaffold extends StatelessWidget {
  const PrimaryScaffold({
    Key? key,
    required this.sliverChild,
    this.appBarText,
    this.appBarAction,
  }) : super(key: key);

  final Widget sliverChild;
  final String? appBarText;
  final List<Widget>? appBarAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          PrimarySliverAppBar(
            appBarText: appBarText,
            appBarAction: appBarAction,
          ),
          sliverChild,
        ],
      ),
      drawer: PrimaryDrawer(),
      bottomNavigationBar: const PrimaryButtomNavigationBar(),
    );
  }
}