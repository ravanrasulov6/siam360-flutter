import '../dtos/sale_dto.dart';

/// Sales/POS repository interface
abstract class SalesRepository {
  Future<List<SaleDto>> getSales({DateTime? date});
  Future<SaleDto?> getSaleById(String id);
  Future<SaleDto> createSale(SaleDto sale);
  Future<double> getTodaySalesTotal();
  Future<double> getMonthSalesTotal();
}

/// Mock implementation of SalesRepository
class MockSalesRepository implements SalesRepository {
  final List<SaleDto> _sales = [];

  @override
  Future<List<SaleDto>> getSales({DateTime? date}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    if (date != null) {
      return _sales.where((s) {
        return s.createdAt.year == date.year &&
            s.createdAt.month == date.month &&
            s.createdAt.day == date.day;
      }).toList();
    }
    
    return _sales;
  }

  @override
  Future<SaleDto?> getSaleById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _sales.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<SaleDto> createSale(SaleDto sale) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _sales.add(sale);
    return sale;
  }

  @override
  Future<double> getTodaySalesTotal() async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock data
    return 254.00;
  }

  @override
  Future<double> getMonthSalesTotal() async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock data
    return 12450.00;
  }
}
