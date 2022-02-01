import 'package:flutter/material.dart';

class PrimaryDrawer extends StatelessWidget {
  PrimaryDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('drawer header'),
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          ),
        ],
      ),
    );
  }
}
