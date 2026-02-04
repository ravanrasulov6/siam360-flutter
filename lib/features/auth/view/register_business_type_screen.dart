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
              child: const OnboardingProgressBar(
                currentStep: 3,
                label: 'Biznes növü',
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
                        color: AppColors.gray900,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Sizə daha yaxşı təcrübə təqdim etmək üçün fəaliyyət sahənizi qeyd edin.',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: AppColors.gray700,
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
                          childAspectRatio: 1.0,
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
              child: Container(
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.push(AppRoutes.registerBusinessSize),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.gray200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? AppColors.primary.withOpacity(0.12)
                  : Colors.black.withOpacity(0.04),
              blurRadius: isSelected ? 16 : 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type.icon,
              color: isSelected ? AppColors.primary : AppColors.gray600,
              size: 28,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                type.label,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.gray900 : AppColors.gray700,
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, size: 10, color: Colors.white),
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
