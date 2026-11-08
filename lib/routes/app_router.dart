import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/layout/admin_shell.dart';
import '../views/screens/auth/login_screen.dart';
import '../views/screens/dashboard/dashboard_screen.dart';
import '../views/screens/ads/ads_screen.dart';
import '../views/screens/notifications/push_notifications_screen.dart';
import '../views/screens/news_feed/blog_detail_screen.dart';
import '../views/screens/news_feed/blog_news_feed_screen.dart';
import '../views/screens/news_feed/create_blog_screen.dart';
import '../views/screens/inspections/inspection_detail_screen.dart';
import '../views/screens/inspections/inspections_screen.dart';
import '../views/screens/users/users_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => AdminShell(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          pageBuilder: (context, state) => const NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/users',
          pageBuilder: (context, state) => const NoTransitionPage(child: UsersScreen()),
        ),
        GoRoute(
          path: '/ads',
          pageBuilder: (context, state) => const NoTransitionPage(child: AdsScreen()),
        ),
        GoRoute(
          path: '/notifications',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: PushNotificationsScreen()),
        ),
        GoRoute(
          path: '/news-feed',
          pageBuilder: (context, state) => const NoTransitionPage(child: BlogNewsFeedScreen()),
          routes: [
            GoRoute(
              path: 'create',
              pageBuilder: (context, state) => const NoTransitionPage(child: CreateBlogScreen()),
            ),
            GoRoute(
              path: ':postId',
              pageBuilder: (context, state) {
                final postId = state.pathParameters['postId']!;
                return NoTransitionPage(child: BlogDetailScreen(postId: postId));
              },
            ),
          ],
        ),
        GoRoute(
          path: '/inspections',
          pageBuilder: (context, state) => const NoTransitionPage(child: InspectionsScreen()),
          routes: [
            GoRoute(
              path: ':inspectionId',
              pageBuilder: (context, state) {
                final id = state.pathParameters['inspectionId']!;
                return NoTransitionPage(child: InspectionDetailScreen(inspectionId: id));
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (context, state) => '/dashboard',
    ),
  ],
);
