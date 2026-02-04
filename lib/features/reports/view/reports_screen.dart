import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siam360/app/theme/app_colors.dart';

/// Reports screen
class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  String _selectedPeriod = 'Aylıq';
  final List<String> _periods = ['Gündəlik', 'Həftəlik', 'Aylıq'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hesabatlar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: _periods.map((period) {
                    final isSelected = _selectedPeriod == period;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedPeriod = period),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.surfaceLight : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 13),
                                    blurRadius: 4,
                                  ),
                                ]
                              : null,
                        ),
                        child: Text(
                          period,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? AppColors.primary : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Total sales
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ümumi satış',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '₼12,450',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.successLight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.trending_up, size: 14, color: AppColors.success),
                      SizedBox(width: 4),
                      Text(
                        '+15.3% keçən aydan',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Best selling products
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ən çox satılan məhsullar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                _productProgressItem('Basic T-shirt', 156, 0.85),
                const SizedBox(height: 12),
                _productProgressItem('Slim Fit Cins', 98, 0.65),
                const SizedBox(height: 12),
                _productProgressItem('Kətan Köynək', 72, 0.45),
                const SizedBox(height: 12),
                _productProgressItem('Sport Ayaqqabı', 54, 0.35),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Grid
          Row(
            children: [
              // Size sales donut chart
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ölçü üzrə satışlar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 120,
                        child: CustomPaint(
                          size: const Size(120, 120),
                          painter: _DonutChartPainter(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _legendRow('S', const Color(0xFF6366F1), '18%'),
                      const SizedBox(height: 6),
                      _legendRow('M', const Color(0xFF8B5CF6), '35%'),
                      const SizedBox(height: 6),
                      _legendRow('L', const Color(0xFFA855F7), '28%'),
                      const SizedBox(height: 6),
                      _legendRow('XL', const Color(0xFFD946EF), '19%'),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Conversion rate
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ayırma → Satış',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: Text(
                          '68%',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'Konversiya nisbəti',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _statColumn('Ayrılanlar', '245'),
                          Container(width: 1, height: 30, color: AppColors.borderLight),
                          _statColumn('Satılanlar', '167'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Return reasons
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Qaytarma səbəbləri',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                _returnReasonItem('Ölçü uyğun gəlmədi', 42),
                const SizedBox(height: 8),
                _returnReasonItem('Rəng fərqli idi', 28),
                const SizedBox(height: 8),
                _returnReasonItem('Keyfiyyət aşağı', 18),
                const SizedBox(height: 8),
                _returnReasonItem('Digər', 12),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _productProgressItem(String name, int count, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              '$count ədəd',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.gray100,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  Widget _legendRow(String label, Color color, String value) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _statColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _returnReasonItem(String reason, int percentage) {
    return Row(
      children: [
        Expanded(
          child: Text(
            reason,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '$percentage%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 20.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    
    final segments = [
      (const Color(0xFF6366F1), 0.18),
      (const Color(0xFF8B5CF6), 0.35),
      (const Color(0xFFA855F7), 0.28),
      (const Color(0xFFD946EF), 0.19),
    ];
    
    double startAngle = -1.57; // Start from top
    
    for (final segment in segments) {
      final sweepAngle = segment.$2 * 2 * 3.14159;
      final paint = Paint()
        ..color = segment.$1
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
