import '../dtos/product_dto.dart';

/// Products repository interface
abstract class ProductsRepository {
  Future<List<ProductDto>> getProducts({String? query, String? category});
  Future<ProductDto?> getProductById(String id);
  Future<bool> updateStock(String id, int quantity);
  Future<ProductDto> createProduct(ProductDto product);
  Future<bool> deleteProduct(String id);
}

/// Mock implementation of ProductsRepository
class MockProductsRepository implements ProductsRepository {
  final List<ProductDto> _products = _generateMockProducts();

  @override
  Future<List<ProductDto>> getProducts({String? query, String? category}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    var result = _products;
    
    if (query != null && query.isNotEmpty) {
      result = result
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    
    if (category != null && category.isNotEmpty) {
      result = result.where((p) => p.categoryId == category).toList();
    }
    
    return result;
  }

  @override
  Future<ProductDto?> getProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> updateStock(String id, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Future<ProductDto> createProduct(ProductDto product) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _products.add(product);
    return product;
  }

  @override
  Future<bool> deleteProduct(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _products.removeWhere((p) => p.id == id);
    return true;
  }

  static List<ProductDto> _generateMockProducts() {
    final now = DateTime.now();
    return [
      ProductDto(
        id: '1',
        name: 'Ağ Köynək',
        price: 25.00,
        stock: 12,
        sizes: ['S', 'M', 'L'],
        colors: ['Ağ'],
        status: 'active',
        createdAt: now,
        updatedAt: now,
      ),
      ProductDto(
        id: '2',
        name: 'Cins Şalvar',
        price: 45.00,
        stock: 5,
        sizes: ['32', '34', '36'],
        colors: ['Mavi'],
        status: 'low_stock',
        createdAt: now,
        updatedAt: now,
      ),
      ProductDto(
        id: '3',
        name: 'Qara Don',
        price: 60.00,
        stock: 8,
        sizes: ['M', 'L'],
        colors: ['Qara'],
        status: 'active',
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }
}
