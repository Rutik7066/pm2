import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/c_chip.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/db/bill_repo.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/page/bill/billImage.dart';
import 'package:pm/util/whatsapp.dart';

class ALlBill extends StatefulWidget {
  const ALlBill({super.key});

  @override
  State<ALlBill> createState() => _ALlBillState();
}

class _ALlBillState extends State<ALlBill> {
  @override
  Widget build(BuildContext context) {
    final textheme = Theme.of(context).textTheme;

    return Scaffold(
      body: StreamBuilder<List<BillModal>>(
          stream: BillRepo().listenToBills(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Cdatatable(
                  headingRowColor: Colors.indigo.shade50,
                  columns: const [
                    DataColumn2(label: Text('#'), size: ColumnSize.S),
                    DataColumn2(label: Text('Date'), size: ColumnSize.M),
                    DataColumn2(label: Text('Total Amount'), size: ColumnSize.M),
                    DataColumn2(label: Text('Discount'), size: ColumnSize.M),
                    DataColumn2(label: Text('Final Amount'), size: ColumnSize.M),
                    DataColumn2(label: Text('Due Amount'), size: ColumnSize.M),
                    DataColumn2(label: Text(''), size: ColumnSize.S),
                  ],
                  row: List.generate(snapshot.data!.length, (index) {
                    BillModal bill = snapshot.data!.reversed.elementAt(index);
                    String date = "${bill.created.day}/${bill.created.month}/${bill.created.year}";
                    return DataRow2.byIndex(
                      index: index,
                      cells: [
                        DataCell(Text(bill.id.toString())),
                        DataCell(Text(date)),
                        DataCell(Text('\u{20B9} ${bill.total}')),
                        DataCell(Text('\u{20B9} ${bill.dis}')),
                        DataCell(Text('\u{20B9} ${bill.finalamt}')),
                        DataCell(
                          CChip(
                            needRuppe: true,
                            title: bill.dues.abs().toString(),
                            themeColor: bill.dues > 0 ? Colors.red : Colors.green,
                          ),
                        ),
                        DataCell(
                          PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: const Text('View'),
                                  onTap: () async => showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      content: BillImage(
                                        id: bill.id,
                                        captureImage: false,
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                    child: const Text('Download'),
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          content: BillImage(
                                            id: bill.id,
                                            captureImage: true,
                                          ),
                                        ),
                                      );
                                    }),
                                PopupMenuItem(
                                    child: const Text('Send'),
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          content: BillImage(
                                            id: bill.id,
                                            captureImage: true,
                                          ),
                                        ),
                                      );
                                      String message = "Hi ${bill.customer.value!.name} \nThank You so much for visiting ${User.fromBox().bussinessname}.\nWe are happy to have you.";
                                      await Whatsapp().createMessage(number: bill.customer.value!.number, message: message);
                                    }),
                                PopupMenuItem(
                                    child: const Text('Delete'),
                                    onTap: () async {
                                      await BillRepo().deleteBill(bill.id).then((value) {
                                        SnackBar snack = const SnackBar(
                                          content: Text('Deleted'),
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 2),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snack);
                                      }).onError((error, stackTrace) {
                                        SnackBar errorSnack = SnackBar(
                                          content: Text('Error :$error'),
                                          backgroundColor: Colors.red,
                                          duration: const Duration(seconds: 10),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(errorSnack);
                                        return null;
                                      });
                                    }),
                              ];
                            },
                          ),
                        )
                      ],
                    );
                  }),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
