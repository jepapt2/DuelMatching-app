import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final purchasesStoreProvider = FutureProvider.autoDispose<Offerings>(
    (ref) async => await Purchases.getOfferings());

class StoreScreen extends HookConsumerWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchases = ref.watch(purchasesStoreProvider);
    return purchases.when(data: (snapshot) {
      final product = snapshot.current?.monthly?.product;
      return Scaffold(
        appBar: AppBar(title: const Text('ストア')),
        body: Column(
          children: [
            Text(snapshot.current?.monthly?.product.priceString ?? ''),
            TextButton(
                onPressed: () async => product != null
                    ? await Purchases.purchaseProduct(product.identifier)
                    : null,
                child: const Text('購入')),
            TextButton(
                onPressed: () async {
                  final purchaserInfo = await Purchases.getPurchaserInfo();
                  final isSubscribing =
                      purchaserInfo.entitlements.all['subscriber']?.isActive;
                  print(isSubscribing);
                },
                child: const Text('確認')),
          ],
        ),
      );
    }, error: (Object error, StackTrace? stackTrace) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(),
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
