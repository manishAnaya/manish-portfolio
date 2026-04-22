import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';

class NavLinks extends StatelessWidget {
  final void Function(String) onTap;
  const NavLinks({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: AppConstants.navItems
          .map((item) => _NavLinkItem(label: item, onTap: () => onTap(item)))
          .toList(),
    );
  }
}

class _NavLinkItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLinkItem({required this.label, required this.onTap});

  @override
  State<_NavLinkItem> createState() => _NavLinkItemState();
}

class _NavLinkItemState extends State<_NavLinkItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: GoogleFonts.notoSans(
              fontSize: 15,
              fontWeight: _hovered ? FontWeight.w500 : FontWeight.w400,
              color: _hovered
                  ? colorScheme.primary
                  : colorScheme.onSurface.withValues(alpha: 0.6),
              letterSpacing: 0.5,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
