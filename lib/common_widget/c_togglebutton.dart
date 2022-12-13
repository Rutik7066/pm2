import 'package:flutter/material.dart';

class CToggleButton extends StatelessWidget {
  const CToggleButton(
      {Key? key,
      required this.isSelected,
      required this.children,
      required this.padding,
      required this.onPressed})
      : super(key: key);
  final List<bool> isSelected;
  final List<String> children;
  final Function(int)? onPressed;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      color: Colors.black.withOpacity(0.50),
      fillColor: Colors.transparent,
      borderRadius: BorderRadius.circular(5.0),
      constraints: const BoxConstraints(minHeight: 35.0),
      isSelected: isSelected,
      onPressed: onPressed,
      children: children
          .map(
            (e) => Padding(
              padding: padding,
              child: Text(e),
            ),
          )
          .toList(),
    );
  }
}
