import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_gradients.dart';
import 'gradient_text.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String label;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Row(
          mainAxisSize: crossAxisAlignment == CrossAxisAlignment.center
              ? MainAxisSize.min
              : MainAxisSize.max,
          children: [
            Container(
              width: 32,
              height: 2,
              decoration: const BoxDecoration(
                gradient: AppGradients.primaryGradient,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label.toUpperCase(),
              style: GoogleFonts.dmMono(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.5,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 32,
              height: 2,
              decoration: const BoxDecoration(
                gradient: AppGradients.primaryGradient,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GradientText(
          title,
          style: textTheme.displaySmall,
          textAlign: crossAxisAlignment == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.start,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: crossAxisAlignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
          ),
        ],
      ],
    );
  }
}
