import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:l_examples/high_order_functions/filter.dart';

import '../main_screen.dart';

class AppRouter {
  AppRouter._();

  /// Key so we can navigate without context.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /*----------------------------------------*/
  static const String filter = 'filter';

  static List<GoRoute> get routes => _routes;

  static final _routes = <GoRoute>[
    GoRoute(
        name: '/',
        path: '/',
        builder: (context, state) {
          return const MainScreen();
        },
        routes: [
          GoRoute(
            name: filter,
            path: filter,
            builder: (context, state) => const FilterFunc(),
          ),
        ]),
  ];
}
