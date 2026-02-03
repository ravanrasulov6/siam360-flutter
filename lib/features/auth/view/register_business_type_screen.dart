import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siam360/app/router.dart';
import 'package:siam360/app/theme/app_colors.dart';
import 'package:siam360/shared/widgets/buttons.dart';

/// Registration step 3 - Business type selection
class RegisterBusinessTypeScreen extends StatefulWidget {
  const RegisterBusinessTypeScreen({super.key});

  @override
  State<RegisterBusinessTypeScreen> createState() => _RegisterBusinessTypeScreenState();
}

class _RegisterBusinessTypeScreenState extends State<RegisterBusinessTypeScreen> {
  int _selectedIndex = 0;

  final List<_BusinessType> _businessTypes = [
    _BusinessType(icon: Icons.checkroom, label: 'Geyim mağazası'),
    _BusinessType(icon: Icons.content_cut, label: 'Gözəllik salonu'),
    _BusinessType(icon: Icons.restaurant, label: 'Kafe / Restoran'),
    _BusinessType(icon: Icons.build, label: 'Xidmət mərkəzi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios),
                    color: AppColors.textPrimary,
                  ),
                  const Expanded(
                    child: Text(
                      'Qeydiyyat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            
            // Progress bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Addım 3',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '3/4',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: AppColors.gray200,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Biznes növünü seçin',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sizə daha yaxşı təcrübə təqdim etmək üçün fəaliyyət sahənizi qeyd edin.',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Fəaliyyət növü',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Business type grid
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.1,
                        ),
                        itemCount: _businessTypes.length,
                        itemBuilder: (context, index) {
                          final isSelected = _selectedIndex == index;
                          final type = _businessTypes[index];
                          
                          return GestureDetector(
                            onTap: () => setState(() => _selectedIndex = index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected 
                                    ? AppColors.primary.withOpacity(0.05)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected 
                                      ? AppColors.primary 
                                      : AppColors.borderLight,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: isSelected 
                                          ? AppColors.primary 
                                          : AppColors.gray100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      type.icon,
                                      color: isSelected 
                                          ? Colors.white 
                                          : AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    type.label,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom button
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: AppColors.borderLight),
                ),
              ),
              child: PrimaryButton(
                label: 'Davam et',
                onPressed: () => context.push(AppRoutes.registerBusinessSize),
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
