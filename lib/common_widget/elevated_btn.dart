import 'package:flutter/material.dart';

ButtonStyle buttonStyle = ButtonStyle(
  // backgroundColor: MaterialStateProperty.all(Colors.blue),
  fixedSize: MaterialStateProperty.all(const Size(100, 35)),
  // textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
);

class ElevatedBtn extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  const ElevatedBtn({super.key, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: child,
    );
  }
}

class TextBtn extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  const TextBtn({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: child,
    );
  }
}

class OutlinedBtn extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  const OutlinedBtn({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: child,
    );
  }
}
