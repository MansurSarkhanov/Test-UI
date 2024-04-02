import 'package:flutter/material.dart';

class BounceFromBottomAnimation extends StatefulWidget {
  const BounceFromBottomAnimation(
      {super.key,
      required this.child,
      required this.delay,
      this.isVertical = true,
      this.isLeft = false,
      this.isBigOffset = false,
      this.isTop = false});

  final Widget child;
  final double delay;
  final bool isVertical;
  final bool isLeft;
  final bool isTop;

  final bool isBigOffset;

  @override
  _BounceFromBottomAnimationState createState() => _BounceFromBottomAnimationState();
}

class _BounceFromBottomAnimationState extends State<BounceFromBottomAnimation> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: (1000 * widget.delay).round()), // Adjust the duration
      vsync: this,
    );

    final Animation<double> curve =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuint); // Use a smoother curve

    animation = Tween<double>(
            begin: widget.isLeft
                ? (widget.isBigOffset)
                    ? -500
                    : -100.0
                : (widget.isBigOffset)
                    ? 500
                    : (widget.isTop)
                        ? -100
                        : 100,
            end: 0.0)
        .animate(curve) // Adjust the end value for less bounce
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: widget.isVertical ? Offset(0, animation.value) : Offset(animation.value, 0),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
