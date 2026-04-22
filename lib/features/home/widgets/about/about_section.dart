import 'package:flutter/material.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/shared/widgets/animated_custom.dart';
import 'package:manish_flutter_portfolio/shared/widgets/section_header.dart';
import 'widgets/about_cards.dart';
import 'widgets/about_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 60 : 100,
      ),

      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const AnimatedCustom(
                child: SectionHeader(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  label: 'About Me',
                  title: 'Who I Am',
                  subtitle:
                      'Flutter developer transitioning into AI — building things that matter.',
                ),
              ),
              const SizedBox(height: 60),
              isDesktop
                  ? const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: AboutText()),
                        SizedBox(width: 60),
                        Expanded(flex: 5, child: AboutCards()),
                      ],
                    )
                  : const Column(
                      children: [
                        AboutText(),
                        SizedBox(height: 40),
                        AboutCards(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
