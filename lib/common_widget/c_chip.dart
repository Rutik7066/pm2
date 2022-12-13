import 'package:flutter/material.dart';


class CChip extends StatelessWidget {
  const CChip({Key? key, required this.title, required this.themeColor, this.needRuppe}) : super(key: key);

  final MaterialColor themeColor;
  final String title;
  final bool? needRuppe;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);
    String rupppe = needRuppe == true ? '\u{20B9}' : '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: themeColor.shade600, width: 0.2),
        color: themeColor.shade50,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        '$rupppe $title',
        style: style.textTheme.bodySmall!.copyWith(color: themeColor.shade600),
      ),
    );
  }
}
