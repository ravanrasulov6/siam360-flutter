/// Reservation DTO
class ReservationDto {
  final String id;
  final String customerId;
  final String customerName;
  final String customerPhone;
  final String serviceType;
  final DateTime dateTime;
  final int durationMinutes;
  final String status;
  final String? notes;
  final DateTime createdAt;

  ReservationDto({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.customerPhone,
    required this.serviceType,
    required this.dateTime,
    required this.durationMinutes,
    required this.status,
    this.notes,
    required this.createdAt,
  });

  factory ReservationDto.fromJson(Map<String, dynamic> json) {
    return ReservationDto(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      customerPhone: json['customer_phone'] as String,
      serviceType: json['service_type'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      durationMinutes: json['duration_minutes'] as int,
      status: json['status'] as String,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'customer_name': customerName,
      'customer_phone': customerPhone,
      'service_type': serviceType,
      'date_time': dateTime.toIso8601String(),
      'duration_minutes': durationMinutes,
      'status': status,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
