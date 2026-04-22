import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';
import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';
import 'package:manish_flutter_portfolio/core/utils/app_launchers.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I\'m currently open to new opportunities — Flutter roles, AI-native product collaborations, '
          'or anything at the intersection of mobile and Generative AI. My inbox is always open.',
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 40),
        _ContactItem(
          icon: Icons.email_rounded,
          label: 'Email',
          value: AppConstants.email,
          onTap: AppLauncher.openEmail,
        ),
        const SizedBox(height: 20),
        _ContactItem(
          icon: Icons.location_on_rounded,
          label: 'Location',
          value: AppConstants.location,
          onTap: AppLauncher.openLocation,
        ),
        const SizedBox(height: 20),
        _ContactItem(
          icon: Icons.work_rounded,
          label: 'LinkedIn',
          value: AppConstants.linkedIn,
          onTap: AppLauncher.openLinkedIn,
        ),
        const SizedBox(height: 48),
        Text(
          'Response Time',
          style: GoogleFonts.dmMono(
            fontSize: 12,
            letterSpacing: 1.5,
            color: colorScheme.onSurface.withValues(alpha: 0.4),
          ),
        ),
        const SizedBox(height: 12),
        const _ResponseTime(),
      ],
    );
  }
}

class _ContactItem extends StatefulWidget {
  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: _hovered
                ? colorScheme.surfaceContainerLow
                : colorScheme.surfaceContainerLowest,
            border: Border.all(
              color: _hovered
                  ? colorScheme.primary.withValues(alpha: 0.4)
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorScheme.primary.withValues(alpha: 0.1),
                ),
                child: Icon(widget.icon, size: 18, color: colorScheme.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.dmMono(
                        fontSize: 11,
                        color: colorScheme.onSurface.withValues(alpha: 0.4),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.value,
                      maxLines: 2,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResponseTime extends StatelessWidget {
  const _ResponseTime();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: [
            AppColors.neonGreen.withValues(alpha: 0.08),
            AppColors.neonCyan.withValues(alpha: 0.08),
          ],
        ),
        border: Border.all(color: AppColors.neonGreen.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          const _PulsingDot(),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Usually responds within 24 hours',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                'Mon – Fri · IST (UTC+5:30)',
                style: GoogleFonts.dmMono(
                  fontSize: 11,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  const _PulsingDot();

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.5, end: 1.0).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, _) => Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: AppColors.neonGreen.withValues(alpha: _anim.value),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.neonGreen.withValues(alpha: _anim.value * 0.6),
              blurRadius: 6,
            ),
          ],
        ),
      ),
    );
  }
}
