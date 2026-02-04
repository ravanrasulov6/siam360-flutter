import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siam360/app/theme/app_colors.dart';
import 'package:siam360/shared/widgets/status_badge.dart';

/// Reservations screen
class ReservationsScreen extends ConsumerStatefulWidget {
  const ReservationsScreen({super.key});

  @override
  ConsumerState<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends ConsumerState<ReservationsScreen> {
  DateTime _selectedDate = DateTime.now();
  final List<int> _days = List.generate(7, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Calendar header
        Container(
          padding: const EdgeInsets.all(20),
          color: AppColors.surfaceLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rezervasiyalar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Müştəri rezervasiyalarını izləyin',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              
              // Month selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chevron_left),
                        color: AppColors.textSecondary,
                      ),
                      const Text(
                        'Yanvar 2026',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chevron_right),
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Bu gün',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Week days
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _days.map((i) {
                  final date = DateTime.now().add(Duration(days: i - 1));
                  final isSelected = date.day == _selectedDate.day && 
                                     date.month == _selectedDate.month && 
                                     date.year == _selectedDate.year;
                  final dayNames = ['B', 'E', 'Ç', 'Ç', 'C', 'C', 'B'];
                  
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDate = date),
                    child: Container(
                      width: 42,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            dayNames[i],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white.withValues(alpha: 204) : AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        
        // Search bar
        Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.backgroundLight,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Müştəri adı və ya telefon...',
              prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
              filled: true,
              fillColor: AppColors.surfaceLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
        
        // Reservations list
        Expanded(
          child: Container(
            color: AppColors.backgroundLight,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _mockReservations.length,
              itemBuilder: (context, index) {
                final reservation = _mockReservations[index];
                return _ReservationCard(reservation: reservation);
              },
            ),
          ),
        ),
        
        // FAB placeholder
      ],
    );
  }
}

class _ReservationCard extends StatelessWidget {
  final _MockReservation reservation;

  const _ReservationCard({required this.reservation});

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
      child: Row(
        children: [
          // Time
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 26),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  reservation.time,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  reservation.duration,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary.withValues(alpha: 204),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reservation.customerName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    StatusBadge(
                      label: reservation.status,
                      type: reservation.statusType,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  reservation.service,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.phone, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      reservation.phone,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Action
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}

class _MockReservation {
  final String time;
  final String duration;
  final String customerName;
  final String service;
  final String phone;
  final String status;
  final StatusType statusType;

  _MockReservation({
    required this.time,
    required this.duration,
    required this.customerName,
    required this.service,
    required this.phone,
    required this.status,
    required this.statusType,
  });
}

final _mockReservations = [
  _MockReservation(
    time: '10:00',
    duration: '1 saat',
    customerName: 'Leyla Əliyeva',
    service: 'Saç üslubu',
    phone: '+994 50 123 45 67',
    status: 'Təsdiqlənib',
    statusType: StatusType.success,
  ),
  _MockReservation(
    time: '11:30',
    duration: '45 dəq',
    customerName: 'Nigar Hüseynova',
    service: 'Manikür',
    phone: '+994 51 234 56 78',
    status: 'Gözləyir',
    statusType: StatusType.warning,
  ),
  _MockReservation(
    time: '14:00',
    duration: '2 saat',
    customerName: 'Günay Məmmədova',
    service: 'Makiyaj',
    phone: '+994 55 345 67 89',
    status: 'Təsdiqlənib',
    statusType: StatusType.success,
  ),
  _MockReservation(
    time: '16:30',
    duration: '30 dəq',
    customerName: 'Aygün Qasımova',
    service: 'Dırnaq dizaynı',
    phone: '+994 70 456 78 90',
    status: 'Yeni',
    statusType: StatusType.info,
  ),
];
