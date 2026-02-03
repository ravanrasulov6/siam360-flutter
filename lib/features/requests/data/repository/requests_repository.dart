import '../dtos/request_dto.dart';

/// Requests repository interface
abstract class RequestsRepository {
  Future<List<RequestDto>> getRequests({String? status});
  Future<RequestDto?> getRequestById(String id);
  Future<bool> updateRequestStatus(String id, String status);
  Future<bool> setAlternativeProduct(String requestId, String productId);
}

/// Mock implementation of RequestsRepository
class MockRequestsRepository implements RequestsRepository {
  final List<RequestDto> _requests = _generateMockRequests();

  @override
  Future<List<RequestDto>> getRequests({String? status}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    if (status != null && status.isNotEmpty && status != 'all') {
      return _requests.where((r) => r.status == status).toList();
    }
    
    return _requests;
  }

  @override
  Future<RequestDto?> getRequestById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _requests.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> updateRequestStatus(String id, String status) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Future<bool> setAlternativeProduct(String requestId, String productId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  static List<RequestDto> _generateMockRequests() {
    final now = DateTime.now();
    return [
      RequestDto(
        id: '1',
        customerId: 'c1',
        customerName: 'Aynur Məmmədova',
        productName: 'Qırmızı Paltar',
        description: 'Toy üçün uyğun qırmızı paltar axtarıram, M ölçü',
        status: 'new',
        confidenceScore: 0.85,
        createdAt: now.subtract(const Duration(hours: 2)),
      ),
      RequestDto(
        id: '2',
        customerId: 'c2',
        customerName: 'Rəşad Əliyev',
        productName: 'Kişi Pencəyi',
        description: 'İş üçün göy rəngdə uyğun pencək, 50 ölçü',
        status: 'reviewing',
        confidenceScore: 0.65,
        createdAt: now.subtract(const Duration(days: 1)),
      ),
    ];
  }
}
