import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:pm/model/transaction_modal.dart';

import '../../common_widget/c_chip.dart';

class CustomerTransactionTab extends StatelessWidget {
  final List<TransactionModal> transactions;
  const CustomerTransactionTab({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          TransactionModal transaction = transactions.elementAt(index);
          return Card(
            child: ListTile(
              title: Text(transaction.title),
              subtitle: Text(DateFormat.yMMMMEEEEd().format(transaction.time)),
              trailing: CChip(
                needRuppe: true,
                title: transaction.transactionAmt.abs().toString(),
                themeColor: transaction.transactionAmt > 0 ? Colors.red : Colors.green,
              ),
            ),
          );
        });
  }
}
