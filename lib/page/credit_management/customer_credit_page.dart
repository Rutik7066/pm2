import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

import 'package:pm/common_widget/c_chip.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/customer_repo.dart';
import 'package:pm/db/transaction_repo.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/page/credit_management/new_transaction.dart';
import 'package:pm/util/whatsapp.dart';
import 'package:provider/provider.dart';

import '../../model/transaction_modal.dart';
import 'provider/new_transaction_provider.dart';

class CustomerCreditPage extends StatelessWidget {
  final int? id;
  const CustomerCreditPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StreamBuilder(
        stream: CustomerRepo().listenToSingleCustomer(id!),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            CustomerModal customer = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.indigo.shade400,
                title: const Text('Customer Credit Management'),
              ),
              body: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Customer Name: ${customer.name}',
                                style: textTheme.bodyLarge,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Customer Number: ${customer.number}',
                                style: textTheme.bodyLarge,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customer.dues > 0
                                  ? Text(
                                      'Customer Dues : \u20B9 ${customer.dues}',
                                      style: textTheme.bodyLarge,
                                    )
                                  : Text(
                                      'Customer Advance:  \u20B9 ${customer.dues.abs()}',
                                      style: textTheme.bodyLarge,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton.icon(
                                style: buttonStyle,
                                icon: const Icon(
                                  Ionicons.logo_whatsapp,
                                  size: 15,
                                ),
                                onPressed: () async {
                                  String message = 'Hi ${customer.number}.\nWe are here to inform you that \nyour payment of \u20A8 ${customer.dues} is still pending. Kindly pay as soon as possible.\nTo get more information about this kindly visit the studio.';
                                  await Whatsapp().createMessage(number: customer.number, message: message);
                                },
                                label: const Text('Notify')),
                          )
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Cdatatable(
                        headingRowColor: Colors.indigo.shade50,
                        columns: const [
                          DataColumn2(label: Text('Date'), size: ColumnSize.M),
                          DataColumn2(label: Text('Note'), size: ColumnSize.L),
                          DataColumn2(label: Text('Dues'), size: ColumnSize.M),
                          DataColumn2(label: Text('Credit'), size: ColumnSize.M),
                        ],
                        row: List.generate(customer.transaction.length, (index) {
                          TransactionModal transaction = customer.transaction.elementAt(index);
                          return DataRow2.byIndex(
                            index: index,
                            cells: [
                              DataCell(Text(DateFormat.yMMMd().format(transaction.time))),
                              DataCell(Text(transaction.title)),
                              DataCell(
                                transaction.transactionAmt < 0
                                    ? const Text('')
                                    : CChip(
                                        needRuppe: true,
                                        title: transaction.transactionAmt.toString(),
                                        themeColor: Colors.red,
                                      ),
                              ),
                              DataCell(
                                transaction.transactionAmt > 0
                                    ? const Text('')
                                    : CChip(
                                        needRuppe: true,
                                        title: transaction.transactionAmt.abs().toString(),
                                        themeColor: Colors.green,
                                      ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                heroTag: 'add_transaction',
                label: const Text('Add Transaction'),
                icon: const Icon(
                  Ionicons.add_outline,
                ),
                onPressed: () async => await showDialog(
                  context: context,
                  builder: (context) => NewTransaction(customer: customer),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
