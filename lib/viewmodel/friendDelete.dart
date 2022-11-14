import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';

friendDocumentDelete({required String userId, required bool isFriend}) async {
  if (isFriend) {
    await userDocument(firebaseCurrentUserId)
        .collection('friends')
        .doc(userId)
        .delete();
  }
}
