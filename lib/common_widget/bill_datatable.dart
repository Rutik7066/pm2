import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:pm/common_widget/border_container.dart';

class DataHeading extends StatelessWidget {
  const DataHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: Colors.indigo.shade200,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text('Product', style: textTheme.bodyLarge),
          ),
          Expanded(
            flex: 2,
            child: Text('Rate', style: textTheme.bodyLarge),
          ),
          Expanded(
            child: Text('Qty', style: textTheme.bodyLarge),
          ),
          Expanded(
            flex: 2,
            child: Text('Total', style: textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class DataTitle extends StatelessWidget {
  final String product;
  final String rate;
  final String qty;
  final String total;
  const DataTitle({
    super.key,
    required this.product,
    required this.qty,
    required this.rate,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.indigo.shade50,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(product, style: textTheme.bodyLarge),
          ),
          Expanded(
            flex: 2,
            child: Text('\u{20B9} $rate', style: textTheme.bodyLarge),
          ),
          Expanded(
            child: Text(qty, style: textTheme.bodyLarge),
          ),
          Expanded(
            flex: 2,
            child: Text('\u{20B9} $total', style: textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
