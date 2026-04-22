import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum AnimationDirection { up, down, left, right, fade }

class AnimatedCustom extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final AnimationDirection direction;
  final double distance;
  const AnimatedCustom({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.direction = AnimationDirection.up,
    this.distance = 40.0,
  });

  @override
  State<AnimatedCustom> createState() => _AnimatedCustomState();
}

class _AnimatedCustomState extends State<AnimatedCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Offset begin;
    final d = widget.distance / 100;
    switch (widget.direction) {
      case AnimationDirection.up:
        begin = Offset(0, d);
        break;
      case AnimationDirection.down:
        begin = Offset(0, -d);
        break;
      case AnimationDirection.left:
        begin = Offset(d, 0);
        break;
      case AnimationDirection.right:
        begin = Offset(-d, 0);
        break;
      case AnimationDirection.fade:
        begin = Offset.zero;
        break;
    }
    _slide = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_hasAnimated) {
      _hasAnimated = true;
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? Key(widget.hashCode.toString()),
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return FadeTransition(
            opacity: _opacity,
            child: SlideTransition(position: _slide, child: child),
          );
        },
        child: widget.child,
      ),
    );
  }
}
