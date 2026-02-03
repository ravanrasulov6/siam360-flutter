import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repository/reports_repository.dart';

/// Reports repository provider
final reportsRepositoryProvider = Provider<ReportsRepository>((ref) {
  return MockReportsRepository();
});

/// Dashboard stats provider
final dashboardStatsProvider = FutureProvider<DashboardStatsDto>((ref) async {
  final repository = ref.watch(reportsRepositoryProvider);
  return repository.getDashboardStats();
});

/// Selected report period provider
final selectedReportPeriodProvider = StateProvider<String>((ref) => 'monthly');

/// Top products provider
final topProductsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final repository = ref.watch(reportsRepositoryProvider);
  return repository.getTopProducts();
});
