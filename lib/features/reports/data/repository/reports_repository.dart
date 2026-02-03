/// Dashboard stats DTO
class DashboardStatsDto {
  final double todaySales;
  final double monthSales;
  final int activeReservations;
  final int lowStockItems;
  final double salesChangePercent;

  DashboardStatsDto({
    required this.todaySales,
    required this.monthSales,
    required this.activeReservations,
    required this.lowStockItems,
    required this.salesChangePercent,
  });

  factory DashboardStatsDto.fromJson(Map<String, dynamic> json) {
    return DashboardStatsDto(
      todaySales: (json['today_sales'] as num).toDouble(),
      monthSales: (json['month_sales'] as num).toDouble(),
      activeReservations: json['active_reservations'] as int,
      lowStockItems: json['low_stock_items'] as int,
      salesChangePercent: (json['sales_change_percent'] as num).toDouble(),
    );
  }
}

/// Reports repository interface
abstract class ReportsRepository {
  Future<DashboardStatsDto> getDashboardStats();
  Future<Map<String, dynamic>> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<List<Map<String, dynamic>>> getTopProducts();
}

/// Mock implementation of ReportsRepository
class MockReportsRepository implements ReportsRepository {
  @override
  Future<DashboardStatsDto> getDashboardStats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    return DashboardStatsDto(
      todaySales: 254.00,
      monthSales: 12450.00,
      activeReservations: 8,
      lowStockItems: 3,
      salesChangePercent: 12.0,
    );
  }

  @override
  Future<Map<String, dynamic>> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    return {
      'total_sales': 12450.00,
      'total_orders': 245,
      'average_order': 50.82,
      'conversion_rate': 0.68,
    };
  }

  @override
  Future<List<Map<String, dynamic>>> getTopProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    return [
      {'name': 'Basic T-shirt', 'count': 156, 'percentage': 0.85},
      {'name': 'Slim Fit Cins', 'count': 98, 'percentage': 0.65},
      {'name': 'Kətan Köynək', 'count': 72, 'percentage': 0.45},
    ];
  }
}
