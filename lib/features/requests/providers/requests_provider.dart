import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dtos/request_dto.dart';
import '../data/repository/requests_repository.dart';

/// Requests repository provider
final requestsRepositoryProvider = Provider<RequestsRepository>((ref) {
  return MockRequestsRepository();
});

/// Selected status filter provider
final selectedStatusFilterProvider = StateProvider<String>((ref) => 'all');

/// Requests list provider
final requestsListProvider = FutureProvider<List<RequestDto>>((ref) async {
  final repository = ref.watch(requestsRepositoryProvider);
  final status = ref.watch(selectedStatusFilterProvider);
  return repository.getRequests(status: status);
});
