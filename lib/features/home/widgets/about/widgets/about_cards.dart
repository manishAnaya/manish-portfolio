import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';
import 'package:manish_flutter_portfolio/shared/widgets/animated_custom.dart';
import 'package:manish_flutter_portfolio/shared/widgets/gradient_text.dart';

class AboutCards extends StatelessWidget {
  const AboutCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimatedCustom(
      direction: AnimationDirection.right,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _MetricCard(
                  value: AppConstants.expYears,
                  label: 'Years\nExperience',
                  emoji: '⚡',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _MetricCard(
                  value: AppConstants.appsBuilt,
                  label: 'Apps\nShipped',
                  emoji: '📱',
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _MetricCard(
                  value: AppConstants.aiCert,
                  label: 'AI\nCertifications',
                  emoji: '🧠',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _MetricCard(
                  value: AppConstants.compWorks,
                  label: 'Companies\nWorked',
                  emoji: '🚀',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatefulWidget {
  const _MetricCard({
    required this.value,
    required this.label,
    required this.emoji,
  });
  final String value;
  final String label;
  final String emoji;

  @override
  State<_MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<_MetricCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colorScheme.surfaceContainerLow,
          border: Border.all(
            color: _hovered
                ? colorScheme.primary.withValues(alpha: 0.4)
                : colorScheme.outlineVariant,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 12),
            GradientText(
              widget.value,
              style: GoogleFonts.syne(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              style: GoogleFonts.dmSans(
                fontSize: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
