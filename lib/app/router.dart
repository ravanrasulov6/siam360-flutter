import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siam360/features/auth/view/login_screen.dart';
import 'package:siam360/features/auth/view/register_personal_screen.dart';
import 'package:siam360/features/auth/view/register_verify_screen.dart';
import 'package:siam360/features/auth/view/register_business_type_screen.dart';
import 'package:siam360/features/auth/view/register_business_size_screen.dart';
import 'package:siam360/features/dashboard/view/dashboard_screen.dart';
import 'package:siam360/features/products/view/products_screen.dart';
import 'package:siam360/features/pos/view/pos_screen.dart';
import 'package:siam360/features/requests/view/requests_screen.dart';
import 'package:siam360/features/reservations/view/reservations_screen.dart';
import 'package:siam360/features/reports/view/reports_screen.dart';
import 'package:siam360/shared/widgets/app_shell_scaffold.dart';

/// App route paths
class AppRoutes {
  AppRoutes._();
  
  static const String login = '/login';
  static const String registerPersonal = '/register/personal';
  static const String registerVerify = '/register/verify';
  static const String registerBusinessType = '/register/business-type';
  static const String registerBusinessSize = '/register/business-size';
  static const String dashboard = '/dashboard';
  static const String products = '/products';
  static const String pos = '/pos';
  static const String requests = '/requests';
  static const String reservations = '/reservations';
  static const String reports = '/reports';
}

/// Navigation key for shell
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

/// App router configuration
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.login,
  debugLogDiagnostics: true,
  routes: [
    // Auth routes (no shell)
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.registerPersonal,
      builder: (context, state) => const RegisterPersonalScreen(),
    ),
    GoRoute(
      path: AppRoutes.registerVerify,
      builder: (context, state) => const RegisterVerifyScreen(),
    ),
    GoRoute(
      path: AppRoutes.registerBusinessType,
      builder: (context, state) => const RegisterBusinessTypeScreen(),
    ),
    GoRoute(
      path: AppRoutes.registerBusinessSize,
      builder: (context, state) => const RegisterBusinessSizeScreen(),
    ),
    
    // Main app routes (with shell)
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppShellScaffold(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.dashboard,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const DashboardScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.products,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ProductsScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.pos,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const PosScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.requests,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const RequestsScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.reservations,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ReservationsScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.reports,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ReportsScreen(),
          ),
        ),
      ],
    ),
  ],
);
