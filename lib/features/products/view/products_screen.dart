import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siam360/app/theme/app_colors.dart';
import 'package:siam360/shared/widgets/status_badge.dart';

/// Products and inventory screen
class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = _mockProducts;
    
    return Column(
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.surfaceLight,
          child: Column(
            children: [
              // Search field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Məhsul axtar (kod, ad)...',
                  prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
                  filled: true,
                  fillColor: AppColors.backgroundLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              const SizedBox(height: 12),
              // Filter chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(label: 'Ölçü', hasDropdown: true),
                    const SizedBox(width: 8),
                    _FilterChip(label: 'Rəng', hasDropdown: true),
                    const SizedBox(width: 8),
                    _FilterChip(label: 'Satılmayan məhsullar'),
                    const SizedBox(width: 8),
                    _FilterChip(label: 'Kateqoriya', hasDropdown: true),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Table header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'MƏHSUL / VARIANT',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Text(
                'STOK / QİYMƏT',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        
        // Product list
        Expanded(
          child: Container(
            color: AppColors.surfaceLight,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _ProductListItem(product: product);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool hasDropdown;

  const _FilterChip({
    required this.label,
    this.hasDropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderLight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          if (hasDropdown) ...[
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.textPrimary),
          ],
        ],
      ),
    );
  }
}

class _ProductListItem extends StatelessWidget {
  final _MockProduct product;

  const _ProductListItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderLight),
        ),
      ),
      child: Row(
        children: [
          // Product image
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.image, color: AppColors.gray400),
          ),
          const SizedBox(width: 16),
          
          // Product info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product.variant,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          // Stock and price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  StatusBadge(
                    label: product.status,
                    type: product.statusType,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '₼${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${product.stock} ədəd',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: product.isLowStock ? FontWeight.bold : FontWeight.normal,
                  color: product.isLowStock 
                      ? (product.statusType == StatusType.error ? AppColors.error : const Color(0xFFF97316))
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MockProduct {
  final String name;
  final String variant;
  final double price;
  final int stock;
  final String status;
  final StatusType statusType;

  _MockProduct({
    required this.name,
    required this.variant,
    required this.price,
    required this.stock,
    required this.status,
    required this.statusType,
  });

  bool get isLowStock => stock < 6;
}

final _mockProducts = [
  _MockProduct(name: 'Ağ Köynək', variant: 'S / M • Pambıq', price: 25.00, stock: 12, status: 'Aktiv', statusType: StatusType.success),
  _MockProduct(name: 'Cins Şalvar (Mavi)', variant: '32/34 • Slim Fit', price: 45.00, stock: 5, status: 'Bitir', statusType: StatusType.warning),
  _MockProduct(name: 'Qara Don', variant: 'M • Ziyafət', price: 60.00, stock: 8, status: 'Aktiv', statusType: StatusType.success),
  _MockProduct(name: 'Qırmızı Sviter', variant: 'L • Yun', price: 35.00, stock: 2, status: 'Bitir', statusType: StatusType.error),
  _MockProduct(name: 'İpək Şərf', variant: 'One Size • İpək', price: 15.00, stock: 20, status: 'Aktiv', statusType: StatusType.success),
  _MockProduct(name: 'Kətan Pencək', variant: 'XL • Bej', price: 85.00, stock: 15, status: 'Aktiv', statusType: StatusType.success),
];
