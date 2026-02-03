import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dtos/reservation_dto.dart';
import '../data/repository/reservations_repository.dart';

/// Reservations repository provider
final reservationsRepositoryProvider = Provider<ReservationsRepository>((ref) {
  return MockReservationsRepository();
});

/// Selected date provider
final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

/// Reservations list provider
final reservationsListProvider = FutureProvider<List<ReservationDto>>((ref) async {
  final repository = ref.watch(reservationsRepositoryProvider);
  final selectedDate = ref.watch(selectedDateProvider);
  return repository.getReservations(date: selectedDate);
});
