import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_gradients.dart';
import 'package:manish_flutter_portfolio/core/utils/app_launchers.dart';
import 'package:manish_flutter_portfolio/shared/models/project_model.dart';
import 'package:manish_flutter_portfolio/shared/widgets/neon_button.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});
  final Project project;

  @override
  State<ProjectCard> createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: _hovered
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.surfaceContainerLow,
          border: Border.all(
            color: _hovered
                ? colorScheme.primary.withValues(alpha: 0.5)
                : colorScheme.outlineVariant,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.15),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.08),
                    colorScheme.primary.withValues(alpha: 0.02),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: colorScheme.surface,
                      border: Border.all(color: colorScheme.outlineVariant),
                    ),
                    child: Center(
                      child: Text(
                        widget.project.emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (widget.project.isFeatured)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: AppGradients.neonGlow,
                            ),
                            child: Text(
                              'Featured',
                              style: GoogleFonts.dmMono(
                                fontSize: 10,
                                color: AppColors.neonCyan,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.description,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.techStack
                        .map((t) => _TechChip(label: t))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      if (widget.project.githubUrl != null)
                        NeonButton(
                          label: 'Code',
                          onPressed: () {},
                          icon: Icons.code_rounded,
                          variant: NeonButtonVariant.outlined,
                          small: true,
                        ),
                      if (widget.project.githubUrl != null)
                        const SizedBox(width: 8),
                      if (widget.project.liveUrl != null ||
                          widget.project.playStoreUrl != null)
                        NeonButton(
                          label: 'View',
                          onPressed: () => AppLauncher.openPlayStore(
                            widget.project.playStoreUrl!,
                          ),
                          icon: Icons.android,
                          small: true,
                        ),
                      if (widget.project.liveUrl != null ||
                          widget.project.appStoreUrl != null) ...[
                        SizedBox(width: 16),
                        NeonButton(
                          label: 'View',
                          onPressed: () => AppLauncher.openAppStore(
                            widget.project.appStoreUrl!,
                          ),
                          icon: Icons.apple,
                          small: true,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorScheme.surfaceContainerHighest,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Text(
        label,
        style: GoogleFonts.dmMono(
          fontSize: 11,
          color: colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}
