import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final EdgeInsets offsetPadding;
  final EdgeInsets insetPadding;
  final double borderRadius;
  final Widget child;
  final Color backgroundColor;
  final List<Color>? gradientColors;

  const CarouselItem({
    Key? key,
    this.offsetPadding = const EdgeInsets.symmetric(horizontal: 0.0),
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.borderRadius = 0.0,
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: offsetPadding,
      child: Container(
        padding: insetPadding,
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: gradientColors != null
              ? LinearGradient(
                  colors: gradientColors!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: child,
      ),
    );
  }
}
