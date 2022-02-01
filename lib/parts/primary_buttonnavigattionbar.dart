import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationIndexProvider =
    StateProvider<IndexName>((ref) => IndexName.users);

enum IndexName { users, recruits, notice }

class PrimaryButtomNavigationBar extends StatelessWidget {
  const PrimaryButtomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final indexNameController = ref.watch(navigationIndexProvider.notifier);
      final indexName = ref.watch(navigationIndexProvider);

      return BottomNavigationBar(
        currentIndex: indexName.index,
        onTap: (index) {
          indexNameController.update((state) => IndexName.values[index]);
          GoRouter.of(context)
              .go('/${IndexName.values[index].name.toString()}');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_sharp),
            label: '探す',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_sharp),
            label: '募集',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '通知'),
        ],
      );
    });
  }
}
