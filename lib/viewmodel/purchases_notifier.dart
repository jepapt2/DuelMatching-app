import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final purchasesNotifierProvider =
    StateNotifierProvider<PurchasesNotifier, bool>(
        (ref) => PurchasesNotifier());

class PurchasesNotifier extends StateNotifier<bool> {
  PurchasesNotifier() : super(false);

  Future<void> purchaserInfoUpdated(PurchaserInfo info) async {
    if (state) return;
    await syncSubscription(info);
  }

  void restore() async {
    state = true;
    final info = await Purchases.restoreTransactions();
    await syncSubscription(info);
    state = false;
  }

// 課金ユーザーになったらtrueを返す
  Future<bool> subscribe(String productID) async {
    try {
      state = true;
      final info = await Purchases.purchaseProduct(productID);
      final isSubscribed = await syncSubscription(info);
      state = false;
      return isSubscribed;
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      final error = _convertPurchasesError(code, additionalCode: e.code);
      throw error;
    }
  }

// 課金ユーザーになったらtrueを返す
  Future<bool> syncSubscription(PurchaserInfo info, {String? productID}) async {
    state = true;
    final func = FirebaseFunctions.instanceFor(region: 'asia-northeast1')
        .httpsCallable('purchase-syncInAppPurchase');
    final result = await func.call();
    var isSubscribed = false;
    if (productID != null) {
      isSubscribed = result.data[productID];
    } else {
      final Map<String, dynamic> map = Map<String, bool>.from(result.data);
      isSubscribed =
          (map).values.firstWhere((element) => element, orElse: () => false);
    }
    state = false;
    return isSubscribed;
  }
}

enum SubscribeErrorCode {
  canceled,
  notAllowed,
  alreadyPurchased,
  receiptAlreadyInUse,
  invalidPurchase,
  noReceipt,
  appStoreError,
  paymentPendingError,
  unexpectedRCError,
  syncFailedToMyBackend,
}

class SubscribeError implements Exception {
  SubscribeError(this.code, {String? message, this.additionalErrorCode})
      : _message = message;
  final SubscribeErrorCode code;
  final String? _message;
  final String? additionalErrorCode;

  String? get message {
    if (_message != null) return _message;

    switch (code) {
      case SubscribeErrorCode.canceled:
        return 'キャンセルされました。';
      case SubscribeErrorCode.appStoreError:
        return '${Platform.isIOS ? 'AppStore' : 'GooglePlayStore'}でエラーが発生しました。時間を置いて再度お試しください。';
      case SubscribeErrorCode.notAllowed:
        return 'お使いのAppleIDは購入が許可されていません。';
      case SubscribeErrorCode.alreadyPurchased:
        return 'この商品はすでに購入済みです。復元をお試しください。';
      case SubscribeErrorCode.receiptAlreadyInUse:
        return '購入情報は別のユーザーで使用されています。別のアカウントにログインしてください。';
      case SubscribeErrorCode.invalidPurchase:
        return '購入情報が不正です。';
      case SubscribeErrorCode.noReceipt:
        return '購入情報が存在していません。';
      case SubscribeErrorCode.unexpectedRCError:
        return '予期せぬエラーが発生しました。スクショを撮影いただきお問い合わせください。[${additionalErrorCode ?? 'none'}]';
      case SubscribeErrorCode.paymentPendingError:
        return '購入には承認が必要です。この端末を管理している方に確認してください。';
      case SubscribeErrorCode.syncFailedToMyBackend:
        return '購入情報の同期に失敗しました。お手数ですがお問合せフォームからお問い合わせをお願いいたします。';
      default:
        return '予期せぬエラーが発生しました。';
    }
  }
}

SubscribeError _convertPurchasesError(PurchasesErrorCode code,
    {String? additionalCode}) {
  switch (code) {
    case PurchasesErrorCode.purchaseCancelledError:
      return SubscribeError(SubscribeErrorCode.canceled);
    case PurchasesErrorCode.storeProblemError:
      return SubscribeError(SubscribeErrorCode.appStoreError);
    case PurchasesErrorCode.purchaseNotAllowedError:
      return SubscribeError(SubscribeErrorCode.notAllowed);
    case PurchasesErrorCode.productAlreadyPurchasedError:
      return SubscribeError(SubscribeErrorCode.alreadyPurchased);
    case PurchasesErrorCode.receiptAlreadyInUseError:
    case PurchasesErrorCode.receiptInUseByOtherSubscriberError:
      return SubscribeError(SubscribeErrorCode.receiptAlreadyInUse);
    case PurchasesErrorCode.missingReceiptFileError:
      return SubscribeError(SubscribeErrorCode.noReceipt);
    case PurchasesErrorCode.invalidAppleSubscriptionKeyError:
    case PurchasesErrorCode.invalidAppUserIdError:
    case PurchasesErrorCode.invalidCredentialsError:
    case PurchasesErrorCode.invalidReceiptError:
      return SubscribeError(SubscribeErrorCode.invalidPurchase);
    case PurchasesErrorCode.paymentPendingError:
      return SubscribeError(SubscribeErrorCode.paymentPendingError);
    default:
      return SubscribeError(SubscribeErrorCode.unexpectedRCError,
          additionalErrorCode: 'RC$additionalCode');
  }
}
