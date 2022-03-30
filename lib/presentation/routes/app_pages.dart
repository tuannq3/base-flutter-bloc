import 'package:baseblocflutter/presentation/main/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

GoRouter getRoute() {
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
    ],
  );
  return _router;
}
