// TODO: Add a routing package to pubspec.yaml dependencies.
// Recommended options:
//   go_router: ^14.0.0
// OR
//   auto_route: ^9.0.0
//   auto_route_generator: ^9.0.0 (dev dependency)

import 'package:flutter/material.dart';

import 'package:app/core/router/route_names.dart';

/// Centralised router configuration for the application.
///
/// Replace the placeholder implementation below with your routing package
/// of choice (go_router, auto_route, etc.).
class AppRouter {
  AppRouter._();

  // -------------------------------------------------------------------------
  // go_router example (uncomment when dependency is added)
  // -------------------------------------------------------------------------
  //
  // static final GoRouter router = GoRouter(
  //   initialLocation: RouteNames.splash,
  //   debugLogDiagnostics: true,
  //   routes: [
  //     GoRoute(
  //       path: RouteNames.splash,
  //       name: RouteNames.splash,
  //       builder: (context, state) => const SplashScreen(),
  //     ),
  //     GoRoute(
  //       path: RouteNames.login,
  //       name: RouteNames.login,
  //       builder: (context, state) => const LoginScreen(),
  //     ),
  //     GoRoute(
  //       path: RouteNames.home,
  //       name: RouteNames.home,
  //       builder: (context, state) => const HomeScreen(),
  //     ),
  //   ],
  //   redirect: (context, state) {
  //     // TODO: Add global redirect logic (e.g., auth checks).
  //     return null;
  //   },
  //   errorBuilder: (context, state) => ErrorScreen(error: state.error),
  // );

  // -------------------------------------------------------------------------
  // Fallback: plain Navigator-based routing (works without extra packages).
  // -------------------------------------------------------------------------

  /// Generates a [Route] for the given [RouteSettings].
  ///
  /// Wire this into [MaterialApp.onGenerateRoute].
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return _buildRoute(
          settings,
          // TODO: Replace with actual SplashScreen widget.
          const Scaffold(body: Center(child: Text('Splash'))),
        );
      case RouteNames.login:
        return _buildRoute(
          settings,
          const Scaffold(body: Center(child: Text('Login'))),
        );
      case RouteNames.home:
        return _buildRoute(
          settings,
          const Scaffold(body: Center(child: Text('Home'))),
        );
      default:
        return _buildRoute(
          settings,
          const Scaffold(body: Center(child: Text('404 - Not Found'))),
        );
    }
  }

  static MaterialPageRoute<dynamic> _buildRoute(
    RouteSettings settings,
    Widget page,
  ) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (_) => page,
    );
  }
}
