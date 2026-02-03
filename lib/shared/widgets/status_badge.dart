import 'package:flutter/material.dart';
import 'package:siam360/app/theme/app_colors.dart';

/// Status badge widget
class StatusBadge extends StatelessWidget {
  final String label;
  final StatusType type;

  const StatusBadge({
    super.key,
    required this.label,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _getTextColor(),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case StatusType.success:
        return AppColors.successLight;
      case StatusType.warning:
        return AppColors.warningLight;
      case StatusType.error:
        return AppColors.errorLight;
      case StatusType.info:
        return AppColors.infoLight;
      case StatusType.neutral:
        return AppColors.gray100;
    }
  }

  Color _getTextColor() {
    switch (type) {
      case StatusType.success:
        return AppColors.success;
      case StatusType.warning:
        return const Color(0xFFB45309);
      case StatusType.error:
        return AppColors.error;
      case StatusType.info:
        return AppColors.info;
      case StatusType.neutral:
        return AppColors.gray600;
    }
  }
}

enum StatusType {
  success,
  warning,
  error,
  info,
  neutral,
}
