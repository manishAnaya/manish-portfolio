import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/features/home/data/portfolio_data.dart';
import 'package:manish_flutter_portfolio/shared/widgets/animated_custom.dart';
import 'package:manish_flutter_portfolio/shared/widgets/neon_button.dart';
import 'package:manish_flutter_portfolio/shared/widgets/section_header.dart';
import 'widgets/project_card.dart';

class ProjectSection extends ConsumerStatefulWidget {
  const ProjectSection({super.key});

  @override
  ConsumerState<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends ConsumerState<ProjectSection> {
  bool _showAll = false;
  @override
  Widget build(BuildContext context) {
    final projects = ref.read(projectsProvider);
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            const AnimatedCustom(
              child: SectionHeader(
                label: 'Projects',
                title: 'What I\'ve Built',
                subtitle:
                    'Production apps across fintech, edtech, e-commerce & enterprise.',
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            const SizedBox(height: 64),
            LayoutBuilder(
              builder: (context, constraints) {
                final cols = isDesktop ? 3 : (isMobile ? 1 : 2);
                final spacing = 24.0;
                final cardWidth =
                    (constraints.maxWidth - (spacing * (cols - 1))) / cols;
                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: List.generate(
                    _showAll ? projects.length : 3,
                    (index) => SizedBox(
                      width: cardWidth,
                      child: AnimatedCustom(
                        delay: Duration(milliseconds: index * 150),
                        child: ProjectCard(project: projects[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 48),
            AnimatedCustom(
              child: NeonButton(
                label: _showAll ? 'Show Less' : 'View All Projects',
                onPressed: () => setState(() => _showAll = !_showAll),
                icon: _showAll
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.grid_view_rounded,
                variant: NeonButtonVariant.outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
