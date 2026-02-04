import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siam360/app/router.dart';
import 'package:siam360/app/theme/app_colors.dart';
import 'package:siam360/shared/widgets/onboarding_progress_bar.dart';

/// Registration step 3 - Business type selection (Premium Redesign)
class RegisterBusinessTypeScreen extends StatefulWidget {
  const RegisterBusinessTypeScreen({super.key});

  @override
  State<RegisterBusinessTypeScreen> createState() => _RegisterBusinessTypeScreenState();
}

class _RegisterBusinessTypeScreenState extends State<RegisterBusinessTypeScreen> {
  int _selectedIndex = 0;

  final List<_BusinessType> _businessTypes = [
    _BusinessType(icon: Icons.checkroom_outlined, label: 'Geyim mağazası'),
    _BusinessType(icon: Icons.content_cut_outlined, label: 'Gözəllik salonu'),
    _BusinessType(icon: Icons.restaurant_outlined, label: 'Kafe / Restoran'),
    _BusinessType(icon: Icons.build_outlined, label: 'Xidmət mərkəzi'),
    _BusinessType(icon: Icons.shopping_bag_outlined, label: 'Market / Mağaza'),
    _BusinessType(icon: Icons.more_horiz_outlined, label: 'Digər'),
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
                progress: 0.75,
                stepText: 'Biznes növü',
                currentStep: '3/4',
              ),
            ),
            
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Biznes növünü seçin',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Sizə daha yaxşı təcrübə təqdim etmək üçün fəaliyyət sahənizi qeyd edin.',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Business type grid
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.05,
                        ),
                        itemCount: _businessTypes.length,
                        itemBuilder: (context, index) {
                          final isSelected = _selectedIndex == index;
                          return _buildTypeCard(index, isSelected);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Action Section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => context.push(AppRoutes.registerBusinessSize),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Davam et',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeCard(int index, bool isSelected) {
    final type = _businessTypes[index];
    
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: isSelected ? 2 : 1.5,
          ),
          boxShadow: isSelected 
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.12),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.backgroundLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                type.icon,
                color: isSelected ? Colors.white : AppColors.textSecondary,
                size: 26,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                type.label,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BusinessType {
  final IconData icon;
  final String label;

  _BusinessType({required this.icon, required this.label});
}
