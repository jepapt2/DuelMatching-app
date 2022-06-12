import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationIndexProvider =
    StateProvider<IndexName>((ref) => IndexName.users);

enum IndexName { users, recruits, notice }

class PrimaryButtomNavigationBar extends StatelessWidget {
  const PrimaryButtomNavigationBar({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          GoRouter.of(context)
              .go('/${IndexName.values[index].name.toString()}');
        },
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userAlt),
            label: '探す',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidFileAlt),
            label: '募集',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '通知'),
        ],
      );
    });
  }
}
