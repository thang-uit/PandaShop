import 'package:flutter/material.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        TypingDot(delay: 0), // Dot 1 delay
        SizedBox(width: 4),
        TypingDot(delay: 200), // Dot 2 delay
        SizedBox(width: 4),
        TypingDot(delay: 400), // Dot 3 delay
      ],
    );
  }
}

class TypingDot extends StatefulWidget {
  final int delay;

  const TypingDot({super.key, required this.delay});

  @override
  State<TypingDot> createState() => _TypingDotState();
}

class _TypingDotState extends State<TypingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    _opacity = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.3, end: 1.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.3), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          widget.delay / 1200,
          (widget.delay + 400) / 1200,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: child,
        );
      },
      child: const Dot(),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: ConstantColors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
