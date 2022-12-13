import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/model/bill_modal.dart';

import '../../common_widget/c_chip.dart';

class CustomerBillTab extends StatelessWidget {
  final List<BillModal> bills;
  const CustomerBillTab({super.key, required this.bills});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Cdatatable(
        headingRowColor: Colors.indigo.shade50,
        columns: const [
          DataColumn2(label: Text('#'), size: ColumnSize.S),
          DataColumn2(label: Text('Date'), size: ColumnSize.L),
          DataColumn2(label: Text('Total')),
          DataColumn2(label: Text('Discount')),
          DataColumn2(label: Text('Final')),
          DataColumn2(label: Text('Due')),
        ],
        row: List.generate(bills.length, (index) {
          BillModal bill = bills.elementAt(index);
          return DataRow.byIndex(index: index, cells: [
            DataCell(Text('${index + 1}')),
            DataCell(Text(DateFormat.yMMMMEEEEd().format(bill.created))),
            DataCell(Text(bill.total.toString())),
            DataCell(Text(bill.dis.toString())),
            DataCell(Text(bill.finalamt.toString())),
            DataCell(
              CChip(
                needRuppe: true,
                title: bill.dues.abs().toString(),
                themeColor: bill.dues > 0 ? Colors.red : Colors.green,
              ),
            ),
          ]);
        }),
      ),
    );
  }
}
