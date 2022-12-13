import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/model/event_modal.dart';

import '../../common_widget/c_chip.dart';

class CustomerEventTab extends StatelessWidget {
  final List<EventModal> events;
  const CustomerEventTab({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Cdatatable(
        headingRowColor: Colors.indigo.shade50,
        columns: const [
          DataColumn2(label: Text('#'), size: ColumnSize.S),
          DataColumn2(label: Text('Event Date'), size: ColumnSize.L),
          DataColumn2(label: Text('Event')),
          DataColumn2(label: Text('Total')),
          DataColumn2(label: Text('Final')),
          DataColumn2(label: Text('Due')),
        ],
        row: List.generate(events.length, (index) {
          EventModal event = events.elementAt(index);
          return DataRow.byIndex(index: index, cells: [
            DataCell(Text('${index + 1}')),
            DataCell(Text(DateFormat.yMMMMEEEEd().format(event.date))),
            DataCell(Text(event.title)),
            DataCell(Text(event.bill.value!.total.toString())),
            DataCell(Text(event.bill.value!.finalamt.toString())),
            DataCell(
              CChip(
                needRuppe: true,
                title: event.bill.value!.dues.abs().toString(),
                themeColor: event.bill.value!.dues > 0 ? Colors.red : Colors.green,
              ),
            ),
          ]);
        }),
      ),
    );
  }
}
