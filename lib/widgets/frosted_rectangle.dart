import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedRectangle extends StatelessWidget {
  final BorderRadius borderRadius;
  final Widget? child;
  final VoidCallback? onPressed;
  final double height;
  final double width;

  const FrostedRectangle({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.all(8),
              width: width,
              height: height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 51, 51, 51).withAlpha(60),
                borderRadius: borderRadius,
                border: Border.all(
                  color: const Color.fromARGB(255, 210, 210, 210).withAlpha(40),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
