import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:duel_matching/screens/account.dart';
import 'package:duel_matching/screens/block_list.dart';
import 'package:duel_matching/screens/chat.dart';
import 'package:duel_matching/screens/friends.dart';
import 'package:duel_matching/screens/group_chat.dart';
import 'package:duel_matching/screens/joined_recruit.dart';
import 'package:duel_matching/screens/login.dart';
import 'package:duel_matching/screens/logout.dart';
import 'package:duel_matching/screens/notice.dart';
import 'package:duel_matching/screens/my_profile.dart';
import 'package:duel_matching/screens/notice_redirect.dart';
import 'package:duel_matching/screens/profile_edit.dart';
import 'package:duel_matching/screens/recruit.dart';
import 'package:duel_matching/screens/recruit_new.dart';
import 'package:duel_matching/screens/recruits.dart';
import 'package:duel_matching/screens/store.dart';
import 'package:duel_matching/screens/user_profile.dart';
import 'package:duel_matching/screens/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/users',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: UsersScreen(),
        ),
      ),
      GoRoute(
        path: '/recruits',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: RecruitsScreen(),
        ),
      ),
      GoRoute(
        path: '/notice',
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: NoticeScreen(
            noticeData: state.extra as Map<String, dynamic>?,
          ),
        ),
      ),
      GoRoute(
        path: '/user/:id',
        builder: (context, state) {
          final userId = state.params['id']!;
          return UserProfileScreen(id: userId);
        },
      ),
      GoRoute(
        path: '/recruit_new',
        builder: (context, state) => RecruitNewScreen(),
      ),
      GoRoute(
        path: '/recruit/:id',
        builder: (context, state) {
          final recruitId = state.params['id']!;
          return RecruitScreen(id: recruitId);
        },
      ),
      GoRoute(
        path: '/chatroom/:id',
        builder: (context, state) {
          final roomId = state.params['id']!;
          return ChatScreen(roomId: roomId);
        },
      ),
      GoRoute(
        path: '/group/:id',
        builder: (context, state) {
          final roomId = state.params['id']!;
          return GroupChatScreen(roomId: roomId);
        },
      ),
      GoRoute(
        path: '/profile_edit',
        builder: (context, state) => ProfileEditScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => MyProfileScreen(
            myProfile: true, id: FirebaseAuth.instance.currentUser!.uid),
      ),
      GoRoute(
        path: '/block',
        builder: (context, state) => const BlockListScreen(),
      ),
      GoRoute(
        path: '/friends',
        builder: (context, state) => const FriendsScreen(),
      ),
      GoRoute(
        path: '/joined',
        builder: (context, state) => const JoinedRecruitScreen(),
      ),
      GoRoute(
        path: '/store',
        builder: (context, state) => const StoreScreen(),
      ),
      GoRoute(
        path: '/logout',
        builder: (context, state) => const LogoutScreen(),
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => AccountScreen(),
      ),
    ],
    redirect: (state) {
      final bool loggedIn = FirebaseAuth.instance.currentUser != null;
      final loggingIn = state.subloc == '/';
      if (!loggedIn) return loggingIn ? null : '/';
      if (loggingIn) return '/users';
      return null;
    },
    initialLocation: '/',
    refreshListenable:
        GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
    navigatorBuilder: (context, state, child) => Navigator(
          onPopPage: (route, dynamic result) {
            route.didPop(result);
            return false; // don't pop the single page on the root navigator
          },
          pages: [
            MaterialPage(
                child: InheritedNavigator(
              child: NoticeRedirect(child: child),
            ))
          ],
        ));
