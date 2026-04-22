import 'package:flutter/material.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'widgets/background_orbs.dart';
import 'widgets/background_grid.dart';
import 'widgets/hero_avtar.dart';
import 'widgets/hero_content.dart';

class HeroSection extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  const HeroSection({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundOrbs(),
        BackgroundGrid(),
        _Hero(sectionKeys: sectionKeys),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  const _Hero({required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 48,
            vertical: isMobile ? 80 : 120,
          ),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: HeroContent(sectionKeys: sectionKeys),
                    ),
                    SizedBox(width: 60),
                    Expanded(flex: 4, child: HeroAvtar()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroAvtar(),
                    SizedBox(height: 48),
                    HeroContent(sectionKeys: sectionKeys),
                  ],
                ),
        ),
      ),
    );
  }
}
