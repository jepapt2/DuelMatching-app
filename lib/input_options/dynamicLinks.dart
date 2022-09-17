import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import '../freezed/recruit/recruit.dart';

String getUriPrefix() {
  const flavor = String.fromEnvironment('FLAVOR');
  if (flavor == 'production') {
    return 'https://duelmatching.page.link';
  } else {
    return 'https://dairi.page.link';
  }
}

Future<Uri> userShareDynamicLinks(
    {required String id, required Profile profile}) async {
  DynamicLinkParameters link = DynamicLinkParameters(
    link: Uri.parse("https://duelmatching.com/?user=$id"),
    uriPrefix: getUriPrefix(),
    androidParameters: const AndroidParameters(
        packageName: 'com.dairi.duelmatching', minimumVersion: 1),
    iosParameters: const IOSParameters(
      bundleId: 'com.dairi.duelmatching',
      appStoreId: '1630632585',
      minimumVersion: '1',
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      imageUrl: Uri.parse(
          'https://duelmatching.com/static/media/TopLogo.f4ad8682.png'),
      title: '${profile.name}のプロフィール',
      description: profile.comment,
    ),
  );

  final ShortDynamicLink shortLink =
      await FirebaseDynamicLinks.instance.buildShortLink(link);
  final Uri shortUrl = shortLink.shortUrl;
  return shortUrl;
}

Future<Uri> recruitShareDynamicLinks(
    {required String id, required Recruit recruit}) async {
  DynamicLinkParameters link = DynamicLinkParameters(
    link: Uri.parse("https://duelmatching.com/?recruit=$id"),
    uriPrefix: getUriPrefix(),
    androidParameters: const AndroidParameters(
        packageName: 'com.dairi.duelmatching', minimumVersion: 1),
    iosParameters: const IOSParameters(
      bundleId: 'com.dairi.duelmatching',
      appStoreId: '1630632585',
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      imageUrl: Uri.parse(
          'https://duelmatching.com/static/media/TopLogo.f4ad8682.png'),
      title: recruit.title,
      description: recruit.overview,
    ),
  );

  final ShortDynamicLink shortLink =
      await FirebaseDynamicLinks.instance.buildShortLink(link);
  final Uri shortUrl = shortLink.shortUrl;
  return shortUrl;
}
