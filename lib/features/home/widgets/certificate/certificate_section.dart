import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/certificate/widgets/certificate_card.dart';
import 'package:manish_flutter_portfolio/shared/models/certificate_model.dart';
import 'package:manish_flutter_portfolio/shared/widgets/section_header.dart';
import 'widgets/arrow_buttons.dart';

class CertificateSection extends StatefulWidget {
  const CertificateSection({super.key});

  @override
  State<CertificateSection> createState() => _CertificateSectionState();
}

class _CertificateSectionState extends State<CertificateSection> {
  final _pageController = PageController(
    viewportFraction: 0.65,
    initialPage: 1,
  );
  int _currentPage = 1;

  static const certificates = [
    Certificate(
      imagePath: 'assets/images/outskill.png',
      title: 'Gen AI Engineering Mastermind',
      issuer: 'Outskill',
      type: 'Certificate of Completion',
      date: '2026',
      accentColor: Color(0xFFA3E635),
    ),
    Certificate(
      imagePath: 'assets/images/scaler.png',
      title: 'Architecture / Mechanics of OpenClaw',
      issuer: 'Scaler Masterclass',
      type: 'Certificate of Participation',
      date: '2 April 2026',
      accentColor: Color(0xFFFB923C),
    ),
    Certificate(
      imagePath: 'assets/images/guvi.png',
      title: 'Master the Power of Generative AI',
      issuer: 'GUVI × HCL',
      type: 'Certificate of Participation',
      date: '17 April 2026',
      accentColor: Color(0xFF22C55E),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _prev() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _next() {
    if (_currentPage < certificates.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 24,
        vertical: isDesktop ? 100 : 60,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SectionHeader(
                    label: 'CERTIFICATIONS',
                    title: 'AI Learning Journey',
                    subtitle:
                        'Certifications earned through active AI upskilling.',
                  ),
                ),
                if (isDesktop)
                  Row(
                    children: [
                      ArrowButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: _prev,
                        enabled: _currentPage > 0,
                      ),
                      const SizedBox(width: 10),
                      ArrowButton(
                        icon: Icons.arrow_forward_ios_rounded,
                        onTap: _next,
                        enabled: _currentPage < certificates.length - 1,
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 48),
            // Carousel
            SizedBox(
              height: isDesktop ? 500 : 220,
              child: PageView.builder(
                controller: _pageController,
                itemCount: certificates.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (_, index) {
                  final cert = certificates[index];
                  final isActive = index == _currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: isActive ? 0 : 16,
                    ),
                    child: CertificateCard(
                      certificate: cert,
                      isActive: isActive,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(certificates.length, (i) {
                final isActive = i == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: isActive
                        ? colorScheme.primary
                        : colorScheme.outlineVariant,
                  ),
                );
              }),
            ),

            // Mobile swipe hint
            if (!isDesktop) ...[
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'swipe to browse',
                  style: GoogleFonts.dmMono(
                    fontSize: 11,
                    color: colorScheme.onSurface.withValues(alpha: 0.3),
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
