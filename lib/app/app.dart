import 'package:flutter/material.dart';
import 'package:siam360/app/router.dart';
import 'package:siam360/app/theme/app_theme.dart';

/// Main application widget
class Siam360App extends StatelessWidget {
  const Siam360App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Siam360',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
