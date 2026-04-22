import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';
import 'package:manish_flutter_portfolio/shared/widgets/animated_custom.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedCustom(
      direction: AnimationDirection.left,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.bio,
            style: textTheme.bodyLarge?.copyWith(
              height: 1.9,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Outside of work, I dive into system design, explore new Flutter packages, '
            'and experiment at the intersection of mobile and AI. Currently working toward '
            'building AI-native Flutter apps.',
            style: textTheme.bodyLarge?.copyWith(
              height: 1.9,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 40),
          const _InfoRow(
            icon: Icons.school_rounded,
            label: 'Degree',
            value: AppConstants.degree,
          ),
          const SizedBox(height: 12),
          const _InfoRow(
            icon: Icons.location_on_rounded,
            label: 'Location',
            value: AppConstants.location,
          ),
          const SizedBox(height: 12),
          const _InfoRow(
            icon: Icons.work_rounded,
            label: 'Company',
            value: AppConstants.currentCompany,
          ),
          const SizedBox(height: 12),
          const _InfoRow(
            icon: Icons.auto_awesome_rounded,
            label: 'Into',
            value: 'Flutter + Generative AI',
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 16, color: colorScheme.primary),
        const SizedBox(width: 12),
        Text(
          '$label:',
          style: GoogleFonts.dmMono(
            fontSize: 13,
            color: colorScheme.onSurface.withValues(alpha: 0.4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
