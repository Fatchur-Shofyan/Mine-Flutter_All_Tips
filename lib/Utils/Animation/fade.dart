import 'package:flutter/material.dart';

class AnimationFade extends StatefulWidget {
  const AnimationFade({Key? key, this.begin = Offset.zero, this.end = const Offset(0, 0.05), this.duration = 3, this.delay = .0, required this.child})
      : super(key: key);

  final Offset begin;
  final Offset end;
  final int duration;
  final double delay;
  final Widget child;

  @override
  _AnimationFadeState createState() => _AnimationFadeState();
}

class _AnimationFadeState extends State<AnimationFade> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration));

    _animation = Tween(
      begin: widget.begin,
      end: widget.end,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(widget.delay, (widget.delay + .5), curve: Curves.easeOut),
    ));

    _animationFade = CurvedAnimation(
      parent: _controller,
      curve: Interval(widget.delay, (widget.delay + .5), curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: FadeTransition(
        opacity: _animationFade,
        child: widget.child,
      ),
    );
  }
}
