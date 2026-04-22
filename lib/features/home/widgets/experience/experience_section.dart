import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/features/home/data/portfolio_data.dart';
import 'package:manish_flutter_portfolio/shared/widgets/animated_custom.dart';
import 'package:manish_flutter_portfolio/shared/widgets/section_header.dart';
import 'widgets/experience_card.dart';

class ExperienceSection extends ConsumerWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences = ref.read(experiencesProvider);
    final isMobile = Responsive.isMobile(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              AnimatedCustom(
                child: SectionHeader(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  label: 'Experience',
                  title: 'Work History',
                  subtitle:
                      'From building production apps to integrating AI — my professional journey.',
                ),
              ),
              const SizedBox(height: 64),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: experiences.length,
                itemBuilder: (_, index) => AnimatedCustom(
                  delay: Duration(milliseconds: index * 150),
                  child: ExperienceCard(
                    experience: experiences[index],
                    isLast: index == experiences.length - 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
