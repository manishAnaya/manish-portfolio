import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/shared/widgets/gradient_text.dart';
import 'package:manish_flutter_portfolio/shared/widgets/made_with_flutter.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = Responsive.isMobile(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: isMobile
          ? Column(
              children: [
                const _LogoBrand(),
                const SizedBox(height: 16),
                const _FooterLinks(),
                const SizedBox(height: 16),
                const MadeWithFlutter(),
                const SizedBox(height: 8),
                _Copyright(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _LogoBrand(),
                Column(
                  children: [
                    const _FooterLinks(),
                    const SizedBox(height: 16),
                    const MadeWithFlutter(),
                  ],
                ),
                _Copyright(),
              ],
            ),
    );
  }
}

class _LogoBrand extends StatelessWidget {
  const _LogoBrand();

  @override
  Widget build(BuildContext context) {
    return GradientText(
      'MKA',
      style: GoogleFonts.syne(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        letterSpacing: 2,
      ),
    );
  }
}

class _FooterLinks extends StatefulWidget {
  const _FooterLinks();

  @override
  State<_FooterLinks> createState() => _FooterLinksState();
}

class _FooterLinksState extends State<_FooterLinks> {
  int? _hoveredIndex;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final links = ['GitHub', 'LinkedIn', 'Resume'];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        links.length,
        (i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: MouseRegion(
            onEnter: (event) => setState(() => _hoveredIndex = i),
            onExit: (event) => setState(() => _hoveredIndex = null),
            child: _hoveredIndex == i
                ? GradientText(
                    links[i],
                    style: GoogleFonts.dmMono(fontSize: 12),
                  )
                : Text(
                    links[i],
                    style: GoogleFonts.dmMono(
                      fontSize: 12,
                      color: colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
          ),
        ),
      ).toList(),
    );
  }
}

class _Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Text(
      '© 2025 ${AppConstants.name}',
      style: GoogleFonts.dmMono(
        fontSize: 12,
        color: colorScheme.onSurface.withValues(alpha: 0.4),
      ),
    );
  }
}
