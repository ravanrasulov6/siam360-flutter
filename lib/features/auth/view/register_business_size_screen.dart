import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siam360/app/router.dart';
import 'package:siam360/app/theme/app_colors.dart';
import 'package:siam360/shared/widgets/onboarding_progress_bar.dart';

/// Registration step 4 - Business size/volume (Premium Redesign)
class RegisterBusinessSizeScreen extends StatefulWidget {
  const RegisterBusinessSizeScreen({super.key});

  @override
  State<RegisterBusinessSizeScreen> createState() => _RegisterBusinessSizeScreenState();
}

class _RegisterBusinessSizeScreenState extends State<RegisterBusinessSizeScreen> {
  int _selectedIndex = 0;

  final List<String> _volumeOptions = [
    '100 - 500 AZN',
    '500 - 1000 AZN',
    '1000+ AZN',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                    color: AppColors.textPrimary,
                  ),
                  const Spacer(),
                  Text(
                    'Qeydiyyat',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            
            // Progress Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: OnboardingProgressBar(
                progress: 1.0,
                stepText: 'Son mərhələ',
                currentStep: '4/4',
              ),
            ),
            
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      'Aylıq satış həcminiz nə qədərdir?',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Bu məlumat sizə uyğun paneli hazırlamaq üçün lazımdır',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 48),
                    
                    // Options List
                    ...List.generate(_volumeOptions.length, (index) {
                      final isSelected = _selectedIndex == index;
                      
                      return _buildSelectionTile(index, isSelected);
                    }),
                    
                    const Spacer(),
                    
                    // Complete Action Section
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: ElevatedButton(
                        onPressed: () => context.go(AppRoutes.dashboard),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          shadowColor: AppColors.primary.withOpacity(0.3),
                        ).copyWith(
                          overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.1)),
                        ),
                        child: Text(
                          'Tamamla',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionTile(int index, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: isSelected ? 2 : 1.5,
          ),
          boxShadow: isSelected 
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _volumeOptions[index],
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.borderLight,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
