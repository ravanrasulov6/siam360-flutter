import '../dtos/reservation_dto.dart';

/// Reservations repository interface
abstract class ReservationsRepository {
  Future<List<ReservationDto>> getReservations({DateTime? date});
  Future<ReservationDto?> getReservationById(String id);
  Future<ReservationDto> createReservation(ReservationDto reservation);
  Future<bool> updateReservationStatus(String id, String status);
  Future<bool> deleteReservation(String id);
}

/// Mock implementation of ReservationsRepository
class MockReservationsRepository implements ReservationsRepository {
  final List<ReservationDto> _reservations = _generateMockReservations();

  @override
  Future<List<ReservationDto>> getReservations({DateTime? date}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    if (date != null) {
      return _reservations.where((r) {
        return r.dateTime.year == date.year &&
            r.dateTime.month == date.month &&
            r.dateTime.day == date.day;
      }).toList();
    }
    
    return _reservations;
  }

  @override
  Future<ReservationDto?> getReservationById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _reservations.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<ReservationDto> createReservation(ReservationDto reservation) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _reservations.add(reservation);
    return reservation;
  }

  @override
  Future<bool> updateReservationStatus(String id, String status) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Future<bool> deleteReservation(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _reservations.removeWhere((r) => r.id == id);
    return true;
  }

  static List<ReservationDto> _generateMockReservations() {
    final now = DateTime.now();
    return [
      ReservationDto(
        id: '1',
        customerId: 'c1',
        customerName: 'Leyla Əliyeva',
        customerPhone: '+994 50 123 45 67',
        serviceType: 'Saç üslubu',
        dateTime: now.add(const Duration(hours: 2)),
        durationMinutes: 60,
        status: 'confirmed',
        createdAt: now,
      ),
      ReservationDto(
        id: '2',
        customerId: 'c2',
        customerName: 'Nigar Hüseynova',
        customerPhone: '+994 51 234 56 78',
        serviceType: 'Manikür',
        dateTime: now.add(const Duration(hours: 4)),
        durationMinutes: 45,
        status: 'pending',
        createdAt: now,
      ),
    ];
  }
}
