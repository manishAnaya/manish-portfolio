import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/shared/widgets/animated_custom.dart';
import 'package:manish_flutter_portfolio/shared/widgets/section_header.dart';
import 'ai_chat_widget.dart';

class AIChatSection extends StatelessWidget {
  const AIChatSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: AnimatedCustom(
            child: Column(
              children: [
                const SectionHeader(
                  label: 'AI Assistant',
                  title: 'Ask Me Anything',
                  subtitle:
                      'Powered by AI — ask about my experience, projects, or skills.',
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                const SizedBox(height: 48),
                // Responsive layout
                isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Left — info panel
                          Expanded(flex: 4, child: _InfoPanel()),
                          const SizedBox(width: 40),
                          // Right — chat
                          Expanded(
                            flex: 6,
                            child: SizedBox(
                              height: 520,
                              child: const AIChatWidget(
                                crossWidget: SizedBox.shrink(),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _InfoPanel(),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: 480,
                            child: const AIChatWidget(
                              crossWidget: SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final points = [
      ('🤖', 'AI-powered', 'Understands context about my work and experience'),
      (
        '⚡',
        'Instant answers',
        'No waiting — get answers about my projects immediately',
      ),
      (
        '📱',
        'Project details',
        'Ask about any app I\'ve built with tech stack and links',
      ),
      (
        '📬',
        'Get in touch',
        'Find out the best way to reach me for opportunities',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...points.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorScheme.surfaceContainerLow,
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Center(
                    child: Text(p.$1, style: const TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.$2,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        p.$3,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.primary.withValues(alpha: 0.06),
            border: Border.all(
              color: colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 16,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'This assistant knows everything about my portfolio — built with the same AI stack I work with daily.',
                  style: GoogleFonts.dmSans(
                    fontSize: 11.5,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
