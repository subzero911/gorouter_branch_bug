import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_branch_bug/main.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'profile',
            ),
          ]),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(
                title: 'Go Router Branch Bug',
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
