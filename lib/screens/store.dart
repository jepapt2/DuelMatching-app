import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Purchases.getOfferings(),
        builder: (context, AsyncSnapshot<Offerings> snapshot) {
          return Scaffold(
            appBar: AppBar(title: const Text('ストア')),
            body: Container(
                child: Text(
                    snapshot.data?.current?.monthly?.product.priceString ??
                        '')),
          );
        });
  }
}
