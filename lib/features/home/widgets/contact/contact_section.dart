import 'package:flutter/material.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/shared/widgets/animated_custom.dart';
import 'package:manish_flutter_portfolio/shared/widgets/section_header.dart';
import 'widgets/contact_form.dart';
import 'widgets/contact_info.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 60 : 100,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            const AnimatedCustom(
              child: SectionHeader(
                label: 'Contact',
                title: 'Let\'s Work Together',
                subtitle:
                    'Open to Flutter roles, AI-native app projects, and collaborations.',
              ),
            ),
            const SizedBox(height: 64),
            isDesktop
                ? const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: AnimatedCustom(
                          direction: AnimationDirection.left,
                          child: ContactInfo(),
                        ),
                      ),
                      SizedBox(width: 60),
                      Expanded(
                        flex: 6,
                        child: AnimatedCustom(
                          direction: AnimationDirection.right,
                          child: ContactForm(),
                        ),
                      ),
                    ],
                  )
                : const Column(
                    children: [
                      ContactInfo(),
                      SizedBox(height: 40),
                      ContactForm(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
