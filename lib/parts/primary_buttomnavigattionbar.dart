import 'package:badges/badges.dart';
import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:duel_matching/parts/adbanner.dart';
import 'package:duel_matching/viewmodel/messages_provider.dart';
import 'package:duel_matching/viewmodel/notices_provider.dart';
import 'package:duel_matching/viewmodel/subscriber_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum IndexName { users, recruits, messages, notice }

class PrimaryButtomNavigationBar extends HookConsumerWidget {
  const PrimaryButtomNavigationBar({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesRef = ref.watch(messagesProvider(firebaseCurrentUserId));
    final noticeRef = ref.watch(noticesProvider(firebaseCurrentUserId));

    //メッセージと通知用の未読数合計
    int getUnreadTotalCount(List<NoticeWithId>? noticeList) {
      //ロードとエラーは0、0の場合はバッジ表示なし
      if (noticeList == null || noticeList.isEmpty) {
        return 0;
      } else {
        //未読数を展開して合計
        List<int> unReadList =
            noticeList.map((n) => n.notice.unReadCount).toList();
        int unReadSum = unReadList.reduce((a, b) => a + b);
        return unReadSum;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SubscriberBannerWhenConsumer(
            id: firebaseCurrentUserId,
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
          items: [
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userLarge),
              label: '探す',
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidFileLines),
              label: '募集',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                child: const FaIcon(FontAwesomeIcons.solidMessage),
                showBadge: getUnreadTotalCount(messagesRef.value) != 0,
                //1000件より多かったら999＋を表示
                badgeContent: Text(
                    getUnreadTotalCount(messagesRef.value) >= 1000
                        ? '999+'
                        : getUnreadTotalCount(messagesRef.value).toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                padding:
                    const EdgeInsets.only(top: 0, bottom: 2, left: 5, right: 5),
                shape: BadgeShape.square,
                borderRadius: BorderRadius.circular(10),
                position: const BadgePosition(start: 12, bottom: 10),
                toAnimate: false,
              ),
              label: 'メッセージ',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                showBadge: getUnreadTotalCount(noticeRef.value) != 0,
                child: const Icon(Icons.notifications),
                //100件より多かったら99＋を表示
                badgeContent: Text(
                    getUnreadTotalCount(noticeRef.value) >= 100
                        ? '99+'
                        : getUnreadTotalCount(noticeRef.value).toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                padding:
                    const EdgeInsets.only(top: 0, bottom: 2, left: 5, right: 5),
                shape: BadgeShape.square,
                borderRadius: BorderRadius.circular(10),
                position: const BadgePosition(start: 12, bottom: 10),
                toAnimate: false,
              ),
              label: '通知',
            ),
          ],
        ),
      ],
    );
  }
}
