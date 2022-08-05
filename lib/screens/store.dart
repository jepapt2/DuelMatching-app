import 'dart:io';

import 'package:duel_matching/viewmodel/purchases_notifier.dart';
import 'package:duel_matching/viewmodel/subscriber_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final purchasesStoreProvider = FutureProvider.autoDispose<Offerings>(
    (ref) async => await Purchases.getOfferings());

class StoreScreen extends HookConsumerWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchases = ref.watch(purchasesStoreProvider);
    final purchasesNotifier = ref.watch(purchasesNotifierProvider.notifier);
    return purchases.when(data: (snapshot) {
      final product = snapshot.current?.monthly?.product;
      return SubscriberWhenConsumer(
        id: FirebaseAuth.instance.currentUser!.uid,
        child: (isSubscriber) => Scaffold(
          appBar: AppBar(title: const Text('サブスクリプション')),
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Card(
                    color: const Color(0xffeff0f3),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            '月額${snapshot.current?.monthly?.product.priceString}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text('・広告削除'),
                                    Text('・フレンド枠10→30'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Expanded(
                                flex: 4,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await Purchases.purchaseProduct(
                                            product!.identifier);
                                      } catch (_) {}
                                    },
                                    child:
                                        Text(isSubscriber ? '購入済み' : '購入する')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Card(
                    color: const Color(0xffeff0f3),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(flex: 5, child: Text('購入情報の復元')),
                            const SizedBox(
                              width: 25.0,
                            ),
                            Expanded(
                              flex: 4,
                              child: ElevatedButton(
                                  onPressed: () {
                                    purchasesNotifier.restore();
                                  },
                                  child: const Text('リストア')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: Platform.isIOS,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () => launchUrl(Uri.parse(
                          'https://support.apple.com/ja-jp/HT202039')),
                      child: const Text(
                        '退会の手順はこちらをご覧ください',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: Platform.isAndroid,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () => launchUrl(Uri.parse(
                          'https://support.google.com/googleplay/answer/7018481')),
                      child: const Text(
                        '退会の手順はこちらをご覧ください',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }, error: (Object error, StackTrace? stackTrace) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('サブスクリプション情報の取得に失敗しました'),
              ElevatedButton(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontWeight: FontWeight.bold)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
                child: const Text('更新する'),
                onPressed: () {
                  GoRouter.of(context).pop();
                  GoRouter.of(context).push('/store');
                },
              ),
            ],
          ),
        ),
      );
    }, loading: () {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
