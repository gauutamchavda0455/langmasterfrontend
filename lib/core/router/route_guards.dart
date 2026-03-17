import 'package:flutter/material.dart';

import 'package:app/core/router/route_names.dart';

/// A route guard checks a condition before allowing navigation to proceed.
///
/// When using go_router, implement guards via the `redirect` callback.
/// When using auto_route, extend `AutoRouteGuard`.
/// The classes below provide a framework-agnostic abstraction you can
/// adapt to either approach.
abstract class RouteGuard {
  /// Returns `null` if the navigation should proceed, or a redirect path
  /// if the user should be sent elsewhere.
  Future<String?> canNavigate(BuildContext context);
}

/// Ensures the user is authenticated before accessing a route.
///
/// If the user is not logged in, they are redirected to [RouteNames.login].
class AuthGuard implements RouteGuard {
  const AuthGuard();

  @override
  Future<String?> canNavigate(BuildContext context) async {
    // TODO: Replace with real authentication check.
    // Example:
    // final authRepo = context.read<AuthRepository>();
    // final isLoggedIn = await authRepo.isAuthenticated;
    const bool isLoggedIn = false; // placeholder

    if (!isLoggedIn) {
      return RouteNames.login;
    }
    return null; // allow navigation
  }
}

/// Prevents authenticated users from reaching auth screens
/// (login, register, etc.) by redirecting them to [RouteNames.home].
class GuestGuard implements RouteGuard {
  const GuestGuard();

  @override
  Future<String?> canNavigate(BuildContext context) async {
    // TODO: Replace with real authentication check.
    const bool isLoggedIn = false; // placeholder

    if (isLoggedIn) {
      return RouteNames.home;
    }
    return null;
  }
}

/// Checks whether the user has completed the onboarding flow.
///
/// If not, redirects to [RouteNames.onboarding].
class OnboardingGuard implements RouteGuard {
  const OnboardingGuard();

  @override
  Future<String?> canNavigate(BuildContext context) async {
    // TODO: Replace with real onboarding-completed check from local storage.
    const bool hasCompletedOnboarding = false; // placeholder

    if (!hasCompletedOnboarding) {
      return RouteNames.onboarding;
    }
    return null;
  }
}

/// Evaluates a list of [RouteGuard]s in order and returns the first
/// redirect, or `null` if all guards pass.
///
/// Useful for composing multiple guards on a single route.
class CompositeGuard implements RouteGuard {
  const CompositeGuard(this.guards);

  final List<RouteGuard> guards;

  @override
  Future<String?> canNavigate(BuildContext context) async {
    for (final guard in guards) {
      final redirect = await guard.canNavigate(context);
      if (redirect != null) return redirect;
    }
    return null;
  }
}
