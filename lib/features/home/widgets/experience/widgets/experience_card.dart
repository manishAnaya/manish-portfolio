import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/shared/models/experience_model.dart';

class ExperienceCard extends StatefulWidget {
  final Experience experience;
  final bool isLast;
  const ExperienceCard({
    super.key,
    required this.experience,
    required this.isLast,
  });

  @override
  State<ExperienceCard> createState() => ExperienceCardState();
}

class ExperienceCardState extends State<ExperienceCard> {
  bool _hovered = false;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = Responsive.isMobile(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline column
        SizedBox(
          width: isMobile ? 40 : 60,
          child: Column(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.experience.isCurrent
                      ? colorScheme.primary.withValues(alpha: 0.15)
                      : colorScheme.surfaceContainerLow,
                  border: Border.all(
                    color: widget.experience.isCurrent
                        ? colorScheme.primary
                        : colorScheme.outlineVariant,
                    width: widget.experience.isCurrent ? 2 : 1,
                  ),
                  boxShadow: widget.experience.isCurrent
                      ? [
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            blurRadius: 12,
                            spreadRadius: 2,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    widget.experience.logoEmoji,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              if (!widget.isLast)
                Container(
                  height: _expanded ? 380 : 240,
                  width: 2,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colorScheme.outlineVariant, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        // Card
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: MouseRegion(
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorScheme.surfaceContainerLow,
                  border: Border.all(
                    color: _hovered
                        ? colorScheme.primary.withValues(alpha: 0.4)
                        : colorScheme.outlineVariant,
                  ),
                  boxShadow: _hovered
                      ? [
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.08),
                            blurRadius: 24,
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.experience.role,
                                      style: textTheme.titleLarge?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  if (widget.experience.isCurrent)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.neonGreen.withValues(
                                          alpha: 0.12,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        border: Border.all(
                                          color: AppColors.neonGreen.withValues(
                                            alpha: 0.4,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Current',
                                        style: GoogleFonts.dmMono(
                                          fontSize: 11,
                                          color: AppColors.neonGreen,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                widget.experience.company,
                                style: textTheme.titleMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 13,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.experience.duration,
                          style: GoogleFonts.dmMono(
                            fontSize: 12,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.location_on_rounded,
                          size: 13,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.experience.location,
                          style: GoogleFonts.dmMono(
                            fontSize: 12,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    AnimatedCrossFade(
                      crossFadeState: _expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                      firstChild: _ResponsibilitiesList(
                        items: widget.experience.responsibilities
                            .take(3)
                            .toList(),
                      ),
                      secondChild: _ResponsibilitiesList(
                        items: widget.experience.responsibilities,
                      ),
                    ),
                    if (widget.experience.responsibilities.length > 3) ...[
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () => setState(() => _expanded = !_expanded),
                        child: Text(
                          _expanded ? '↑ Show less' : '↓ Show more',
                          style: GoogleFonts.dmMono(
                            fontSize: 12,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ResponsibilitiesList extends StatelessWidget {
  const _ResponsibilitiesList({required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (r) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      r,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
