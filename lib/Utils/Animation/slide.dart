import 'package:flutter/material.dart';

class AnimationSlide extends StatefulWidget {
  const AnimationSlide(
      {Key? key,
      this.begin = Offset.zero,
      this.end = const Offset(0, 0.05),
      this.duration = 3,
      this.delay = .0,
      required this.child})
      : super(key: key);

  final Offset begin;
  final Offset end;
  final int duration;
  final double delay;
  final Widget child;
  @override
  _AnimationSlideState createState() => _AnimationSlideState();
}

class _AnimationSlideState extends State<AnimationSlide>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: widget.duration),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: widget.begin,
    end: widget.end,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCubic,
  ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
