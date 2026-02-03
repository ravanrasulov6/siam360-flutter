/// Request DTO
class RequestDto {
  final String id;
  final String customerId;
  final String customerName;
  final String productName;
  final String description;
  final String status;
  final double confidenceScore;
  final String? alternativeProductId;
  final DateTime createdAt;

  RequestDto({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.productName,
    required this.description,
    required this.status,
    required this.confidenceScore,
    this.alternativeProductId,
    required this.createdAt,
  });

  factory RequestDto.fromJson(Map<String, dynamic> json) {
    return RequestDto(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      productName: json['product_name'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      confidenceScore: (json['confidence_score'] as num).toDouble(),
      alternativeProductId: json['alternative_product_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'customer_name': customerName,
      'product_name': productName,
      'description': description,
      'status': status,
      'confidence_score': confidenceScore,
      'alternative_product_id': alternativeProductId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
