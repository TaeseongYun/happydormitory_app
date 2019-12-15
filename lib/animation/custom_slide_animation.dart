import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class CustomSlideAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  CustomSlideAnimation({
    this.child,
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final tween = MultiTrackTween(
      [
        Track('translateY').add(
            Duration(milliseconds: 1500), Tween(begin: height * 0.4, end: 0.0),
            curve: Curves.easeOut)
      ],
    );
    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Transform.translate(
        offset: Offset(
          0,
          animation["translateY"],
        ),
        child: child,
      ),
    );
  }
}
