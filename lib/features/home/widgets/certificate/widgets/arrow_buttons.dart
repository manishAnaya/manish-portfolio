import 'package:flutter/material.dart';

class ArrowButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;

  const ArrowButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.enabled,
  });

  @override
  State<ArrowButton> createState() => ArrowButtonState();
}

class ArrowButtonState extends State<ArrowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.enabled ? widget.onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.enabled && _hovered
                ? colorScheme.primary.withValues(alpha: 0.1)
                : colorScheme.surfaceContainerLow,
            border: Border.all(
              color: widget.enabled
                  ? (_hovered
                        ? colorScheme.primary.withValues(alpha: 0.6)
                        : colorScheme.primary.withValues(alpha: 0.3))
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Icon(
            widget.icon,
            size: 16,
            color: widget.enabled
                ? colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.2),
          ),
        ),
      ),
    );
  }
}
