import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/input_options/dynamicLinks.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:share_plus/share_plus.dart';

final myprofileTooltipProvider = StateProvider.autoDispose((ref) {
  final tooltipController = JustTheController();
  return tooltipController;
});

class MyProfileScreen extends HookConsumerWidget {
  const MyProfileScreen({Key? key, required this.id, required this.initialEdit})
      : super(key: key);

  final String id;
  final bool initialEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double appbarSize = MediaQuery.of(context).size.height / 2.7 >= 310
        ? MediaQuery.of(context).size.height / 2.7
        : 310;
    final tooltipController = ref.watch(myprofileTooltipProvider);

    return UserWhenConsumer(
      child: (user) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              shape: Border.all(width: 0, style: BorderStyle.none),
              centerTitle: true,
              pinned: true,
              expandedHeight: appbarSize,
              leading: Visibility(
                visible: !initialEdit,
                child: Center(
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context).pop(),
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_back,
                            size: 26,
                          )
                        ]),
                  ),
                ),
              ),
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: JustTheTooltip(
                      controller: tooltipController,
                      triggerMode: TooltipTriggerMode.manual,
                      showDuration: const Duration(seconds: 10),
                      content: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '更新したプロフィールをSNSで共有してみましょう！',
                          )),
                      child: GestureDetector(
                        onTap: () async {
                          Uri uri = await userShareDynamicLinks(
                              id: id, profile: user);
                          Share.share(
                              'DuelMatchingで${user.name}と対戦しよう！ ${uri.toString()} #DuelMatching');
                        },
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              const Positioned(
                                  right: 5.0,
                                  child: Icon(
                                    Icons.share,
                                    size: 22,
                                  )),
                            ]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Visibility(
                  visible: !initialEdit,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                          GoRouter.of(context).push('/profile_edit');
                        },
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              const Positioned(
                                left: 7.0,
                                child: FaIcon(
                                  FontAwesomeIcons.userPen,
                                  size: 16,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Column(
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                              color: Color(0xff2a2a2a),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                background:
                    Stack(alignment: AlignmentDirectional.topCenter, children: [
                  const SizedBox(
                    height: 200,
                  ),
                  user.header.isNotNullAndNotEmpty
                      ? Image.network(
                          user.header!,
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.black54,
                          width: double.infinity,
                          height: 200.0,
                        ),
                  Positioned(
                    top: 150,
                    child: AvatarImage(avatar: user.avatar, radius: 50),
                  ),
                ]),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (user.comment.isNotNullAndNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(user.comment!),
                        ),
                      Visibility(
                        visible: user.activityDay.isNotNullAndNotEmpty ||
                            user.activityTime.isNotNullAndNotEmpty ||
                            user.adress.isNotNullAndNotEmpty ||
                            user.age.isNotNullAndNotEmpty ||
                            user.favorite.isNotNullAndNotEmpty ||
                            user.playTitle != null &&
                                user.playTitle!.isNotEmpty ||
                            user.remoteDuel != null ||
                            user.sex.isNotNullAndNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 10.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: IntrinsicColumnWidth(),
                                  1: FlexColumnWidth(10.0),
                                },
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: [
                                  if (user.playTitle != null &&
                                      user.playTitle!.isNotEmpty)
                                    TableRow(children: [
                                      const Text('プレイタイトル'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 8.0),
                                        child: Wrap(
                                            spacing: 2.0,
                                            runSpacing: 5.0,
                                            children: user.playTitle!
                                                .map((t) => Chip(
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    label: Text(t)))
                                                .toList()),
                                      )
                                    ]),
                                  if (user.favorite.isNotNullAndNotEmpty)
                                    TableRow(children: [
                                      const Text('好きなカード'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 8.0),
                                        child: Text(user.favorite!),
                                      )
                                    ]),
                                  if (user.adress.isNotNullAndNotEmpty)
                                    TableRow(children: [
                                      const Text('居住地'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 8.0),
                                        child: Text(user.adress!),
                                      )
                                    ]),
                                  if (user.remoteDuel != null)
                                    TableRow(children: [
                                      const Text('リモート対戦環境'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 8.0),
                                        child: Text(
                                            user.remoteDuel! ? 'あり' : 'なし'),
                                      )
                                    ]),
                                  if (user.activityDay.isNotNullAndNotEmpty)
                                    TableRow(children: [
                                      const Text('活動日'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 8.0),
                                        child: Text(user.activityDay!),
                                      )
                                    ]),
                                  if (user.activityTime.isNotNullAndNotEmpty)
                                    TableRow(children: [
                                      const Text('活動時間'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 8.0),
                                        child: Text(user.activityTime!),
                                      )
                                    ]),
                                  if (user.age.isNotNullAndNotEmpty)
                                    TableRow(children: [
                                      const Text('年齢'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 8.0),
                                        child: Text(user.age!),
                                      )
                                    ]),
                                  if (user.sex.isNotNullAndNotEmpty)
                                    TableRow(children: [
                                      const Text('性別'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 8.0),
                                        child: Text(user.sex!),
                                      )
                                    ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (user.introduction.isNotNullAndNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 10.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('自己紹介'),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(user.introduction!)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      Visibility(
                          visible: initialEdit,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // return profile!.when(data: data, error: error, loading: loading);
  }

  ImageProvider<Object> avatarImage(String? avatar) {
    if (avatar.isNotNullAndNotEmpty) {
      return NetworkImage(avatar!);
    } else {
      return const AssetImage('assets/images/initial_avatar.png');
    }
  }
}
