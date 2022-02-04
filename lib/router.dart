import 'package:duel_matching/screens/login.dart';
import 'package:duel_matching/screens/notice.dart';
import 'package:duel_matching/screens/profile_edit.dart';
import 'package:duel_matching/screens/recruits.dart';
import 'package:duel_matching/screens/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/users',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const UsersScreen(),
      ),
    ),
    GoRoute(
      path: '/recruits',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const RecruitsScreen(),
      ),
    ),
    GoRoute(
      path: '/notice',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const NoticeScreen(),
      ),
    ),
    GoRoute(
      path: '/profile_edit',
      builder: (context, state) => ProfileEditScreen(),
    )
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
);
