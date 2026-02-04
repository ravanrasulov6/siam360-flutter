import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siam360/app/router.dart';
import 'package:siam360/app/theme/app_colors.dart';
import 'package:siam360/shared/widgets/onboarding_progress_bar.dart';

/// Registration step 2 - OTP verification (Premium Redesign)
class RegisterVerifyScreen extends StatefulWidget {
  const RegisterVerifyScreen({super.key});

  @override
  State<RegisterVerifyScreen> createState() => _RegisterVerifyScreenState();
}

class _RegisterVerifyScreenState extends State<RegisterVerifyScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

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
                currentStep: 2,
                label: 'Təsdiqləmə',
              ),
            ),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 32),
                        Text(
                          'Nömrənin təsdiqlənməsi',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: AppColors.gray900,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Telefon nömrənizə göndərilən kodu daxil edin',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: AppColors.gray700,
                            height: 1.5,
                          ),
                        ),
                        
                        const SizedBox(height: 48),
                        
                        // OTP input fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(6, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: _buildOtpField(index),
                            );
                          }),
                        ),
                        
                        const SizedBox(height: 56),
                        
                        // Action Button
                        Container(
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () => context.push(AppRoutes.registerBusinessType),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Təsdiqlə',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Resend Section
                        Column(
                          children: [
                            Text(
                              'Kod gəlmədi?',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextButton(
                              onPressed: () {
                                // Logic for resend
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.primary,
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Yenidən göndər',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
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

  Widget _buildOtpField(int index) {
    return Container(
      width: 48,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _focusNodes[index].hasFocus ? AppColors.primary : AppColors.gray200,
          width: _focusNodes[index].hasFocus ? 2 : 1,
        ),
        boxShadow: _focusNodes[index].hasFocus 
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 31),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                )
              ]
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 10),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                )
              ],
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.gray900,
          ),
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {
            _onCodeChanged(index, value);
            setState(() {});
          },
        ),
      ),
    );
  }
}
