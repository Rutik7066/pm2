import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Color? bordeColor;

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;

  const BorderContainer({super.key, this.bordeColor, this.borderRadius, this.margin, this.width, this.height, required this.child, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(8.0),
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        border: Border.all(
          width: 0.7,
          strokeAlign: StrokeAlign.outside,
          style: BorderStyle.solid,
          color: bordeColor ?? Colors.grey.shade400,
        ),
        borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}
