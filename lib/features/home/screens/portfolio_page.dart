import 'package:flutter/material.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/about/about_section.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/ai_chat/ai_chat_fab.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/ai_chat/ai_chat_section.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/certificate/certificate_section.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/contact/contact_section.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/experience/experience_section.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/hero/hero_section.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/nav_bar/portfolio_footer.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/nav_bar/portfolio_nav_bar.dart';
import 'package:manish_flutter_portfolio/features/home/widgets/project/project_section.dart';
import 'package:manish_flutter_portfolio/shared/widgets/animated_custom.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Experience': GlobalKey(),
    'Certificates': GlobalKey(),
    'Projects': GlobalKey(),
    'AI Chat': GlobalKey(),
    'Contact': GlobalKey(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    KeyedSubtree(
                      key: _sectionKeys['Home'],
                      child: HeroSection(sectionKeys: _sectionKeys),
                    ),
                    _SectionDivider(),
                    KeyedSubtree(
                      key: _sectionKeys['About'],
                      child: AboutSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys['Experience'],
                      child: ExperienceSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys['Certificates'],
                      child: AnimatedCustom(child: CertificateSection()),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys['Projects'],
                      child: ProjectSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys['AI Chat'],
                      child: AIChatSection(),
                    ),
                    KeyedSubtree(
                      key: _sectionKeys['Contact'],
                      child: ContactSection(),
                    ),
                    PortfolioFooter(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavBar(
              scaffoldKey: _scaffoldKey,
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
            ),
          ),
          Positioned(
            bottom: 32,
            right: 96,
            child: _ScrollToTopButton(scrollController: _scrollController),
          ),
          const Positioned.fill(child: AIChatFAB()),
        ],
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            colorScheme.outlineVariant,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

class _ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;
  const _ScrollToTopButton({required this.scrollController});

  @override
  State<_ScrollToTopButton> createState() => __ScrollToTopButtonState();
}

class __ScrollToTopButtonState extends State<_ScrollToTopButton> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final visible = widget.scrollController.offset > 400;
    if (visible != _visible) setState(() => _visible = visible);
  }

  void onTap() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedScale(
        scale: _visible ? 1 : 0.5,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.surfaceContainerLow,
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.4),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: colorScheme.primary,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
