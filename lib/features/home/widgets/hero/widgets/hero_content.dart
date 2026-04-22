import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';
import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';
import 'package:manish_flutter_portfolio/core/utils/app_launchers.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/shared/widgets/gradient_text.dart';
import 'package:manish_flutter_portfolio/shared/widgets/neon_button.dart';

class HeroContent extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  final bool centered;
  const HeroContent({
    super.key,
    this.centered = false,
    required this.sectionKeys,
  });

  void _scrollTo(String section, BuildContext context) {
    final key = sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final align = centered
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: align,
      children: [
        // Available badge
        Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.neonCyan.withValues(alpha: 0.4),
                ),
                borderRadius: BorderRadius.circular(100),
                color: AppColors.neonCyan.withValues(alpha: 0.08),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.neonGreen,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.neonGreen,
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Available for opportunities',
                    style: GoogleFonts.dmMono(
                      fontSize: 12,
                      color: AppColors.neonCyan,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            )
            .animate()
            .fadeIn(delay: 100.ms, duration: 600.ms)
            .slideY(begin: -0.2, end: 0),

        const SizedBox(height: 24),

        Text(
              AppConstants.name,
              style: textTheme.displayLarge?.copyWith(
                fontSize: Responsive.value(
                  context,
                  mobile: 36,
                  tablet: 52,
                  desktop: 68,
                ),
              ),
              textAlign: centered ? TextAlign.center : TextAlign.start,
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 700.ms)
            .slideY(begin: 0.3, end: 0),

        const SizedBox(height: 12),

        GradientText(
              AppConstants.title,
              style: textTheme.headlineMedium?.copyWith(
                fontSize: Responsive.value(
                  context,
                  mobile: 16,
                  tablet: 20,
                  desktop: 24,
                ),
                fontWeight: FontWeight.w600,
              ),
              textAlign: centered ? TextAlign.center : TextAlign.start,
            )
            .animate()
            .fadeIn(delay: 350.ms, duration: 700.ms)
            .slideY(begin: 0.3, end: 0),

        const SizedBox(height: 20),

        Text(
              AppConstants.tagline,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
                fontSize: Responsive.value(context, mobile: 15, desktop: 17),
              ),
              textAlign: centered ? TextAlign.center : TextAlign.start,
            )
            .animate()
            .fadeIn(delay: 450.ms, duration: 700.ms)
            .slideY(begin: 0.3, end: 0),

        const SizedBox(height: 40),

        Wrap(
          spacing: 24,
          runSpacing: 16,
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          children: const [
            _StatChip(value: AppConstants.expYears, label: 'Years Exp.'),
            _StatChip(value: AppConstants.appsBuilt, label: 'Apps Shipped'),
            _StatChip(value: AppConstants.aiCert, label: 'AI Certs'),
          ],
        ).animate().fadeIn(delay: 550.ms, duration: 700.ms),

        const SizedBox(height: 40),

        Wrap(
              spacing: 16,
              runSpacing: 12,
              alignment: centered ? WrapAlignment.center : WrapAlignment.start,
              children: [
                NeonButton(
                  label: 'View Projects',
                  onPressed: () => _scrollTo('Projects', context),
                  icon: Icons.rocket_launch_rounded,
                ),
                NeonButton(
                  label: 'Download CV',
                  onPressed: AppLauncher.downloadCv,
                  icon: Icons.download_rounded,
                  variant: NeonButtonVariant.outlined,
                ),
              ],
            )
            .animate()
            .fadeIn(delay: 650.ms, duration: 700.ms)
            .slideY(begin: 0.3, end: 0),

        const SizedBox(height: 40),

        _SocialLinks(
          centered: centered,
        ).animate().fadeIn(delay: 750.ms, duration: 700.ms),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GradientText(
          value,
          style: GoogleFonts.syne(fontSize: 28, fontWeight: FontWeight.w800),
        ),
        Text(
          label,
          style: GoogleFonts.dmMono(
            fontSize: 12,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.4),
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks({this.centered = false});
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: centered
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        _SocialChip(
          label: 'GitHub',
          icon: Icons.code_rounded,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          onTap: AppLauncher.openGithub,
        ),

        // LinkedIn
        _SocialChip(
          label: 'LinkedIn',
          icon: Icons.work_rounded,
          color: AppColors.neonBlue,
          onTap: AppLauncher.openLinkedIn,
        ),

        // Email
        _SocialChip(
          label: 'Email',
          icon: Icons.email_rounded,
          color: AppColors.neonCyan,
          onTap: AppLauncher.openEmail,
        ),
      ],
    );
  }
}

class _SocialChip extends StatefulWidget {
  const _SocialChip({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_SocialChip> createState() => _SocialChipState();
}

class _SocialChipState extends State<_SocialChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered
                  ? widget.color.withValues(alpha: 0.6)
                  : colorScheme.outlineVariant,
            ),
            color: _hovered
                ? widget.color.withValues(alpha: 0.1)
                : colorScheme.surface.withValues(alpha: 0.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 14,
                color: _hovered
                    ? widget.color
                    : colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: GoogleFonts.dmMono(
                  fontSize: 12,
                  color: _hovered
                      ? widget.color
                      : colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
