import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manish_flutter_portfolio/features/home/screens/portfolio_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: PortfolioPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    child: Scaffold(
      body: Center(child: Text('Page not found: ${state.error}')),
    ),
  ),
);
