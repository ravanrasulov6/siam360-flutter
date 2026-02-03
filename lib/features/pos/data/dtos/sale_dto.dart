/// Sale DTO
class SaleDto {
  final String id;
  final List<SaleItemDto> items;
  final double subtotal;
  final double discount;
  final double total;
  final String paymentMethod;
  final String? customerId;
  final DateTime createdAt;

  SaleDto({
    required this.id,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.paymentMethod,
    this.customerId,
    required this.createdAt,
  });

  factory SaleDto.fromJson(Map<String, dynamic> json) {
    return SaleDto(
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => SaleItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      paymentMethod: json['payment_method'] as String,
      customerId: json['customer_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((e) => e.toJson()).toList(),
      'subtotal': subtotal,
      'discount': discount,
      'total': total,
      'payment_method': paymentMethod,
      'customer_id': customerId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

class SaleItemDto {
  final String productId;
  final String productName;
  final String? variant;
  final int quantity;
  final double unitPrice;
  final double total;

  SaleItemDto({
    required this.productId,
    required this.productName,
    this.variant,
    required this.quantity,
    required this.unitPrice,
    required this.total,
  });

  factory SaleItemDto.fromJson(Map<String, dynamic> json) {
    return SaleItemDto(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      variant: json['variant'] as String?,
      quantity: json['quantity'] as int,
      unitPrice: (json['unit_price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'variant': variant,
      'quantity': quantity,
      'unit_price': unitPrice,
      'total': total,
    };
  }
}
