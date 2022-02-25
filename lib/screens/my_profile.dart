import 'package:duel_matching/parts/user_when_consumer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:duel_matching/extension/string.dart';

class MyProfileScreen extends HookConsumerWidget {
  const MyProfileScreen({Key? key, required this.myProfile, required this.id})
      : super(key: key);

  final bool myProfile;
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserWhenConsumer(
      child: (user) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretchTriggerOffset: 50.0,
              onStretchTrigger: () => stertchTrigger(),
              automaticallyImplyLeading: false,
              shape: Border.all(width: 0, style: BorderStyle.none),
              centerTitle: true,
              pinned: true,
              expandedHeight: 285.0,
              leading: Center(
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
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
              actions: [
                Center(
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
                            const FaIcon(
                              FontAwesomeIcons.userEdit,
                              size: 16,
                            )
                          ]),
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
                          style: TextStyle(
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
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: avatarImage(user.avatar),
                    ),
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
                      Padding(
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
                                      padding: const EdgeInsets.all(8.0),
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(user.favorite!),
                                    )
                                  ]),
                                if (user.adress.isNotNullAndNotEmpty)
                                  TableRow(children: [
                                    const Text('居住地'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(user.adress!),
                                    )
                                  ]),
                                if (user.remoteDuel != null)
                                  TableRow(children: [
                                    const Text('リモート対戦環境'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(user.remoteDuel! ? 'あり' : 'なし'),
                                    )
                                  ]),
                                if (user.activityDay.isNotNullAndNotEmpty)
                                  TableRow(children: [
                                    Text('活動日'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(user.activityDay!),
                                    )
                                  ]),
                                if (user.activityTime.isNotNullAndNotEmpty)
                                  TableRow(children: [
                                    const Text('活動時間'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(user.activityTime!),
                                    )
                                  ]),
                                if (user.age.isNotNullAndNotEmpty)
                                  TableRow(children: [
                                    const Text('年齢'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(user.age!),
                                    )
                                  ]),
                                if (user.sex.isNotNullAndNotEmpty)
                                  TableRow(children: [
                                    const Text('性別'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(user.sex!),
                                    )
                                  ]),
                              ],
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('自己紹介'),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(user.introduction!)
                                ],
                              ),
                            ),
                          ),
                        ),
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

  Future<void> stertchTrigger() async {
    print('a');
  }
}
