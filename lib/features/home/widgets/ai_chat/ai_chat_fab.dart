import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_gradients.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'ai_chat_widget.dart';

class AIChatFAB extends StatefulWidget {
  const AIChatFAB({super.key});

  @override
  State<AIChatFAB> createState() => _AIChatFABState();
}

class _AIChatFABState extends State<AIChatFAB>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _fadeAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _scaleAnim = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _isOpen = !_isOpen);
    if (_isOpen) {
      _ctrl.forward();
    } else {
      _ctrl.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final colorScheme = Theme.of(context).colorScheme;

    // Panel dimensions
    final panelWidth = isMobile ? MediaQuery.of(context).size.width : 400.0;
    final panelHeight = isMobile
        ? MediaQuery.of(context).size.height * 0.85
        : 580.0;

    return Stack(
      children: [
        // ── Backdrop (mobile only) ──────────────────────
        if (isMobile && _isOpen)
          Positioned.fill(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: GestureDetector(
                onTap: _toggle,
                child: Container(color: Colors.black.withValues(alpha: 0.4)),
              ),
            ),
          ),

        // ── Chat Panel ──────────────────────────────────
        Positioned(
          bottom: isMobile ? 0 : 90,
          right: isMobile ? 0 : 24,
          child: AnimatedBuilder(
            animation: _ctrl,
            builder: (_, child) => Transform.translate(
              offset: Offset(
                isMobile ? 0 : (1 - _ctrl.value) * (panelWidth + 24),
                isMobile ? (1 - _ctrl.value) * panelHeight : 0,
              ),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: ScaleTransition(
                  scale: _scaleAnim,
                  alignment: isMobile
                      ? Alignment.bottomCenter
                      : Alignment.bottomRight,
                  child: child,
                ),
              ),
            ),
            child: _isOpen
                ? Container(
                    width: panelWidth,
                    height: panelHeight,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: isMobile
                          ? const BorderRadius.vertical(
                              top: Radius.circular(24),
                            )
                          : BorderRadius.circular(20),
                      border: Border.all(color: colorScheme.outlineVariant),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 40,
                          spreadRadius: 0,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Expanded(
                          child: AIChatWidget(
                            showCross: true,
                            crossWidget: GestureDetector(
                              onTap: _toggle,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorScheme.surfaceContainerHighest,
                                ),
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 16,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        Positioned(
          bottom: 24,
          right: 24,
          child: _FABButton(isOpen: _isOpen, onTap: _toggle),
        ),
      ],
    );
  }
}

class _FABButton extends StatefulWidget {
  const _FABButton({required this.isOpen, required this.onTap});
  final bool isOpen;
  final VoidCallback onTap;

  @override
  State<_FABButton> createState() => _FABButtonState();
}

class _FABButtonState extends State<_FABButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(
            0,
            _hovered && !widget.isOpen ? -4 : 0,
            0,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Main FAB
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppGradients.primaryGradient,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.neonCyan.withValues(alpha: 0.4),
                      blurRadius: _hovered ? 24 : 16,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, anim) =>
                      ScaleTransition(scale: anim, child: child),
                  child: Icon(
                    widget.isOpen
                        ? Icons.close_rounded
                        : Icons.auto_awesome_rounded,
                    key: ValueKey(widget.isOpen),
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              // Pulse ring when closed

              // "AI" label badge
              if (!widget.isOpen)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.neonGreen,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'AI',
                      style: GoogleFonts.dmMono(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
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
