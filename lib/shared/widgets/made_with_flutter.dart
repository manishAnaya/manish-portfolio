import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MadeWithFlutter extends StatefulWidget {
  const MadeWithFlutter({super.key});

  @override
  State<MadeWithFlutter> createState() => _MadeWithFlutterState();
}

class _MadeWithFlutterState extends State<MadeWithFlutter> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _hovered
                ? colorScheme.surfaceContainerLow
                : Colors.transparent,
            border: Border.all(
              color: _hovered ? colorScheme.outlineVariant : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Terminal prompt
              Text(
                '> ',
                style: GoogleFonts.dmMono(
                  fontSize: 12,
                  color: colorScheme.primary.withValues(alpha: 0.6),
                ),
              ),
              Text(
                'Built with ',
                style: GoogleFonts.dmMono(
                  fontSize: 12,
                  color: colorScheme.onSurface.withValues(alpha: 0.35),
                ),
              ),
              // Flutter logo via FlutterLogo widget
              const FlutterLogo(size: 14),
              Text(
                ' flutter',
                style: GoogleFonts.dmMono(
                  fontSize: 12,
                  color: colorScheme.onSurface.withValues(alpha: 0.35),
                ),
              ),
              Text(
                ' & ',
                style: GoogleFonts.dmMono(
                  fontSize: 12,
                  color: colorScheme.onSurface.withValues(alpha: 0.35),
                ),
              ),
              Text(
                '♥',
                style: GoogleFonts.dmMono(
                  fontSize: 12,
                  color: Colors.redAccent.withValues(alpha: 0.8),
                ),
              ),
              // Blinking cursor
              _BlinkingCursor(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlinkingCursor extends StatefulWidget {
  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0, end: 1).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, _) => Opacity(
        opacity: _anim.value,
        child: Text(
          ' ▌',
          style: GoogleFonts.dmMono(fontSize: 12, color: colorScheme.primary),
        ),
      ),
    );
  }
}
