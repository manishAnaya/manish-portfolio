import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NeonButtonVariant { filled, outlined, ghost }

class NeonButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final NeonButtonVariant variant;
  final Color? color;
  final bool small;

  const NeonButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = NeonButtonVariant.filled,
    this.color,
    this.small = false,
  });

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final accent = widget.color ?? colorScheme.primary;
    final padding = widget.small
        ? const EdgeInsets.symmetric(horizontal: 16, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 28, vertical: 14);
    final fontSize = widget.small ? 12.0 : 14.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.variant == NeonButtonVariant.filled
                ? (_hovered ? accent : accent.withValues(alpha: 0.85))
                : Colors.transparent,
            border: Border.all(
              color: widget.variant == NeonButtonVariant.ghost
                  ? Colors.transparent
                  : (_hovered ? accent : accent.withValues(alpha: 0.6)),
              width: 1.5,
            ),
            boxShadow: widget.variant == NeonButtonVariant.filled && _hovered
                ? [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.4),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: widget.small ? 14 : 16,
                  color: widget.variant == NeonButtonVariant.filled
                      ? colorScheme.onPrimary
                      : accent,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: GoogleFonts.dmMono(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  color: widget.variant == NeonButtonVariant.filled
                      ? colorScheme.onPrimary
                      : (_hovered ? accent : accent.withValues(alpha: 0.8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
