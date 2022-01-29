import 'package:duel_matching/screens/login.dart';
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
      builder: (context, state) => UsersScreen(),
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
