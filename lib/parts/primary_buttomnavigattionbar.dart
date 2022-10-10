import 'package:duel_matching/parts/adbanner.dart';
import 'package:duel_matching/viewmodel/subscriber_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationIndexProvider =
    StateProvider<IndexName>((ref) => IndexName.users);

enum IndexName { users, recruits, messages, notice }

class PrimaryButtomNavigationBar extends StatelessWidget {
  const PrimaryButtomNavigationBar({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SubscriberBannerWhenConsumer(
              id: FirebaseAuth.instance.currentUser!.uid,
              child: (isSubscribed) {
                if (!isSubscribed) {
                  return const AdBanner(size: AdSize.fullBanner);
                } else {
                  return const SizedBox();
                }
              }),
          BottomNavigationBar(
            showUnselectedLabels: true,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: pageIndex,
            onTap: (index) {
              GoRouter.of(context)
                  .go('/${IndexName.values[index].name.toString()}');
            },
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.userLarge),
                label: '探す',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidFileLines),
                label: '募集',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidMessage),
                label: 'メッセージ',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: '通知'),
            ],
          ),
        ],
      );
    });
  }
}
