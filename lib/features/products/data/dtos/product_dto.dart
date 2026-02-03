/// Product DTO
class ProductDto {
  final String id;
  final String name;
  final String? description;
  final double price;
  final int stock;
  final String? categoryId;
  final String? imageUrl;
  final List<String> sizes;
  final List<String> colors;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductDto({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    this.categoryId,
    this.imageUrl,
    this.sizes = const [],
    this.colors = const [],
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int,
      categoryId: json['category_id'] as String?,
      imageUrl: json['image_url'] as String?,
      sizes: (json['sizes'] as List<dynamic>?)?.cast<String>() ?? [],
      colors: (json['colors'] as List<dynamic>?)?.cast<String>() ?? [],
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'category_id': categoryId,
      'image_url': imageUrl,
      'sizes': sizes,
      'colors': colors,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
