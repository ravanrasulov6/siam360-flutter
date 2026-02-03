import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siam360/app/theme/app_colors.dart';
import 'package:siam360/shared/widgets/status_badge.dart';

/// Requests and orders screen
class RequestsScreen extends ConsumerStatefulWidget {
  const RequestsScreen({super.key});

  @override
  ConsumerState<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends ConsumerState<RequestsScreen> {
  String _selectedFilter = 'Hamısı';
  final List<String> _filters = ['Hamısı', 'Yeni', 'Baxılır', 'Tapıldı', 'Alternativ'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header and filters
        Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.surfaceLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sorğular və Sifarişlər',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Müştəri sorğularını idarə edin',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _filters.map((filter) {
                    final isSelected = _selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(filter),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() => _selectedFilter = filter);
                        },
                        selectedColor: AppColors.primary,
                        backgroundColor: AppColors.backgroundLight,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: isSelected ? AppColors.primary : AppColors.borderLight,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        
        // Request list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _mockRequests.length,
            itemBuilder: (context, index) {
              final request = _mockRequests[index];
              return _RequestCard(request: request);
            },
          ),
        ),
      ],
    );
  }
}

class _RequestCard extends StatelessWidget {
  final _MockRequest request;

  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    request.customerName.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.customerName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      request.timestamp,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              StatusBadge(
                label: request.status,
                type: request.statusType,
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Product info
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, color: AppColors.gray400),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.productName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      request.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Confidence indicator
          Row(
            children: [
              Text(
                'Uyğunluq: ',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: request.confidence,
                    backgroundColor: AppColors.gray100,
                    valueColor: AlwaysStoppedAnimation<Color>(_getConfidenceColor(request.confidence)),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${(request.confidence * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: _getConfidenceColor(request.confidence),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Actions
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: AppColors.borderLight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Alternativ təklif et',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Sorğunu təsdiqlə',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getConfidenceColor(double confidence) {
    if (confidence >= 0.7) return AppColors.success;
    if (confidence >= 0.4) return const Color(0xFFF59E0B);
    return AppColors.error;
  }
}

class _MockRequest {
  final String customerName;
  final String timestamp;
  final String productName;
  final String description;
  final String status;
  final StatusType statusType;
  final double confidence;

  _MockRequest({
    required this.customerName,
    required this.timestamp,
    required this.productName,
    required this.description,
    required this.status,
    required this.statusType,
    required this.confidence,
  });
}

final _mockRequests = [
  _MockRequest(
    customerName: 'Aynur Məmmədova',
    timestamp: 'Bu gün, 14:30',
    productName: 'Qırmızı Paltar',
    description: 'Toy üçün uyğun qırmızı paltar axtarıram, M ölçü',
    status: 'Yeni',
    statusType: StatusType.info,
    confidence: 0.85,
  ),
  _MockRequest(
    customerName: 'Rəşad Əliyev',
    timestamp: 'Dünən, 18:15',
    productName: 'Kişi Pencəyi',
    description: 'İş üçün göy rəngdə uyğun pencək, 50 ölçü',
    status: 'Baxılır',
    statusType: StatusType.warning,
    confidence: 0.65,
  ),
  _MockRequest(
    customerName: 'Leyla Hüseynova',
    timestamp: '2 gün əvvəl',
    productName: 'Uşaq Paltosu',
    description: '5 yaş üçün qış paltosu, qara rəng',
    status: 'Tapıldı',
    statusType: StatusType.success,
    confidence: 0.92,
  ),
];
