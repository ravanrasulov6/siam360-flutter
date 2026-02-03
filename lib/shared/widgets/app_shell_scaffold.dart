import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siam360/app/router.dart';
import 'package:siam360/app/theme/app_colors.dart';
import 'package:siam360/shared/widgets/side_nav.dart';
import 'package:siam360/shared/widgets/top_bar.dart';

/// App shell scaffold with sidebar navigation for desktop/web
/// and drawer navigation for mobile
class AppShellScaffold extends StatelessWidget {
  final Widget child;
  
  const AppShellScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      drawer: isDesktop ? null : const SideNavDrawer(),
      body: isDesktop
          ? Row(
              children: [
                const SideNav(),
                Expanded(
                  child: Column(
                    children: [
                      TopBar(
                        showMenuButton: false,
                        onLogout: () => context.go(AppRoutes.login),
                      ),
                      Expanded(child: child),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                TopBar(
                  showMenuButton: true,
                  onMenuPressed: () => Scaffold.of(context).openDrawer(),
                  onLogout: () => context.go(AppRoutes.login),
                ),
                Expanded(child: child),
              ],
            ),
    );
  }
}

/// Drawer wrapper for mobile navigation
class SideNavDrawer extends StatelessWidget {
  const SideNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surfaceLight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.store,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Stitch',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _DrawerNavItem(
                    icon: Icons.dashboard_outlined,
                    label: 'Panel',
                    route: AppRoutes.dashboard,
                  ),
                  _DrawerNavItem(
                    icon: Icons.inventory_2_outlined,
                    label: 'Məhsullar',
                    route: AppRoutes.products,
                  ),
                  _DrawerNavItem(
                    icon: Icons.point_of_sale_outlined,
                    label: 'Kassa',
                    route: AppRoutes.pos,
                  ),
                  _DrawerNavItem(
                    icon: Icons.inbox_outlined,
                    label: 'Sorğular',
                    route: AppRoutes.requests,
                  ),
                  _DrawerNavItem(
                    icon: Icons.calendar_month_outlined,
                    label: 'Rezervasiyalar',
                    route: AppRoutes.reservations,
                  ),
                  _DrawerNavItem(
                    icon: Icons.analytics_outlined,
                    label: 'Hesabatlar',
                    route: AppRoutes.reports,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;

  const _DrawerNavItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    final isSelected = currentRoute == route;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: AppColors.primary.withOpacity(0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
    );
  }
}
