import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dtos/product_dto.dart';
import '../data/repository/products_repository.dart';

/// Products repository provider
final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return MockProductsRepository();
});

/// Products list provider
final productsListProvider = FutureProvider.family<List<ProductDto>, String?>(
  (ref, query) async {
    final repository = ref.watch(productsRepositoryProvider);
    return repository.getProducts(query: query);
  },
);

/// Selected category provider
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

/// Filtered products provider
final filteredProductsProvider = FutureProvider<List<ProductDto>>((ref) async {
  final repository = ref.watch(productsRepositoryProvider);
  final category = ref.watch(selectedCategoryProvider);
  return repository.getProducts(category: category);
});

/// Product search query provider
final productSearchQueryProvider = StateProvider<String>((ref) => '');
