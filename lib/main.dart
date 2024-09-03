import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: <GoRoute>[
          ...AppRouter.routes,
        ],
        redirect: (context, state) {
          // log('url => ${state.uri.toString()}');
          return null;
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
