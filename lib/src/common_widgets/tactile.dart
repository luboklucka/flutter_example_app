import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Tactile extends StatefulWidget {
  const Tactile({
    Key? key,
    this.endScale,
    this.duration,
    required this.onPressed,
    this.disabled = false,
    this.onTapUp,
    required this.child,
  }) : super(key: key);

  final double? endScale;

  final Duration? duration;
  final VoidCallback onPressed;
  final GestureTapUpCallback? onTapUp;
  final bool disabled;
  final Widget child;

  @override
  State<Tactile> createState() => _TactileState();
}

class _TactileState extends State<Tactile> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _scale;

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Tactile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.duration != oldWidget.duration ||
        widget.endScale != oldWidget.endScale) {
      _update();
    }
  }

  void _update() {
    _controller ??= AnimationController(vsync: this);
    _controller?.duration =
        widget.duration ?? const Duration(milliseconds: 200);

    if (_controller != null) {
      _scale = Tween<double>(begin: 1.0, end: widget.endScale ?? 0.96).animate(
        CurvedAnimation(
          parent: _controller!,
          curve: Curves.ease,
        ),
      );
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.disabled) _controller?.forward();
  }

  void _handleTapCancel() {
    if (!widget.disabled) _controller?.reverse();
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.disabled) {
      return;
    }
    _controller?.reverse();
    HapticFeedback.lightImpact();
    widget.onTapUp?.call(details);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: widget.onPressed,
        child: _scale != null
            ? ScaleTransition(
                scale: _scale!,
                child: widget.child,
              )
            : null);
  }
}
