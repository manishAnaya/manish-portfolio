import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/theme_provider.dart';
import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/nav_bar/widgets/nav_links.dart';
import 'package:manish_flutter_portfolio/shared/widgets/gradient_text.dart';
import 'package:manish_flutter_portfolio/shared/widgets/made_with_flutter.dart';
import 'widgets/theme_toggle.dart';

class PortfolioNavBar extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  final Map<String, GlobalKey> sectionKeys;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const PortfolioNavBar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
    required this.scaffoldKey,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PortfolioNavBarState();
}

class _PortfolioNavBarState extends ConsumerState<PortfolioNavBar> {
  bool _scrolled = false;
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 50;
    if (_scrolled != scrolled) {
      setState(() => _scrolled = scrolled);
    }
  }

  void _scrollTo(String section) {
    final key = widget.sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
    if (_menuOpen) setState(() => _menuOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final color = Theme.of(context).colorScheme;
    final isMobile = Responsive.isMobile(context);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: _scrolled
                    ? color.surface.withValues(alpha: 0.2)
                    : Colors.transparent,
                border: _scrolled
                    ? Border(
                        bottom: BorderSide(
                          color: color.outlineVariant,
                          width: 0.1,
                        ),
                      )
                    : null,
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      _LogoWidget(),
                      if (!isMobile) MadeWithFlutter(),
                      const Spacer(),
                      if (!isMobile) ...[
                        NavLinks(onTap: _scrollTo),
                        const SizedBox(width: 24),
                      ],
                      ThemeToggle(themeMode: themeMode),
                      if (isMobile) ...[
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => setState(() => _menuOpen = !_menuOpen),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: color.outlineVariant),
                              color: color.surfaceContainerLow,
                            ),
                            child: Icon(
                              _menuOpen
                                  ? Icons.close_rounded
                                  : Icons.menu_rounded,
                              size: 18,
                              color: color.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // ── Mobile dropdown ───────────────────────
            if (isMobile)
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
                child: _menuOpen
                    ? Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: color.surface.withValues(alpha: 0.95),
                          border: Border(
                            bottom: BorderSide(color: color.outlineVariant),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: AppConstants.navItems.map((item) {
                            return GestureDetector(
                              onTap: () => _scrollTo(item),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: color.outlineVariant.withValues(
                                        alpha: 0.4,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      item,
                                      style: GoogleFonts.dmMono(
                                        fontSize: 14,
                                        color: color.onSurface,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 12,
                                      color: color.primary,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
          ],
        ),
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientText(
      'MKA',
      style: GoogleFonts.syne(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        letterSpacing: 2,
        color: Colors.white,
      ),
    );
  }
}
