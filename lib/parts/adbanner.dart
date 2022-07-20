import 'package:duel_matching/gen/admob_options.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// StatelessWidgetを継承して作成
class AdBanner extends StatelessWidget {
  const AdBanner({Key? key, required this.size}) : super(key: key);
  final AdSize size;

  @override
  Widget build(BuildContext context) {
    final banner = BannerAd(
        // サイズ
        size: size,
        // 広告ID
        adUnitId: AdManager.bannerAdUnitId,
        // イベントのコールバック
        listener: BannerAdListener(
            // onAdLoaded: (Ad ad) => print('Ad loaded.'),
            // onAdFailedToLoad: (Ad ad, LoadAdError error) {
            //   print('Ad failed to load: $error');
            // },
            // onAdOpened: (Ad ad) => print('Ad opened.'),
            // onAdClosed: (Ad ad) => print('Ad closed.'),
            ),
        // リクエストはデフォルトを使う
        request: const AdRequest())
      // 表示を行うloadをつける
      ..load();

    // 戻り値はContainerで包んで返す
    return SizedBox(
        width: banner.size.width.toDouble(),
        height: banner.size.height.toDouble(),
        child: AdWidget(ad: banner));
  }
}
