import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/db/qotation_repo.dart';
import 'package:pm/model/quotation_modal.dart';
import 'package:pm/page/quotation/provider/all_quotation_provider.dart';
import 'package:pm/page/quotation/quotation_image.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_text_input.dart';
import '../../util/whatsapp.dart';

class AllQuotation extends StatelessWidget {
  const AllQuotation({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<AllQuotationProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormTextField(
                      prefixIcon: const Icon(EvilIcons.search),
                      labelText: 'Enter Customer Name',
                      onChanged: (v) => provider.chnageFilter(v),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Expanded(child: Container()),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: provider.listenToQuotes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Cdatatable(
                        headingRowColor: Colors.indigo.shade50,
                        columns: const [
                          DataColumn2(label: Text('#'), size: ColumnSize.S),
                          DataColumn2(label: Text('Quote Date'), size: ColumnSize.M),
                          DataColumn2(label: Text('Customer Name'), size: ColumnSize.M),
                          DataColumn2(label: Text('Total Amt'), size: ColumnSize.M),
                          DataColumn2(label: Text('Discount Amt'), size: ColumnSize.M),
                          DataColumn2(label: Text('Final Amt'), size: ColumnSize.M),
                          DataColumn2(label: Text(''), size: ColumnSize.S),
                        ],
                        row: List.generate(
                          snapshot.data!.length,
                          (index) {
                            QuotationModal quote = snapshot.data!.reversed.elementAt(index);
                            return DataRow2.byIndex(
                              index: index,
                              cells: [
                                DataCell(Text(quote.id.toString())),
                                DataCell(Text(DateFormat.yMMMd().format(quote.created))),
                                DataCell(Text(quote.customer.value?.name ?? '')),
                                DataCell(Text(quote.total.toString())),
                                DataCell(Text(quote.dis.toString())),
                                DataCell(Text(quote.finalamt.toString())),
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
                                              content: QuotationImage(
                                                id: quote.id,
                                                captureImage: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem(
                                            child: const Text('Download'),
                                            onTap: () async {
                                              showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                  contentPadding: EdgeInsets.zero,
                                                  content: QuotationImage(
                                                    id: quote.id,
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
                                                  content: QuotationImage(
                                                    id: quote.id,
                                                    captureImage: true,
                                                  ),
                                                ),
                                              );
                                              if (quote.customer.value != null) {
                                                print('Whatsapp Opened');
                                                await Whatsapp().createMessage(number: quote.customer.value!.number, message: "");
                                              }
                                            }),
                                        PopupMenuItem(
                                            child: const Text('Delete'),
                                            onTap: () async {
                                              await QuotationRepo().deleteQuotation(quote.id).then((value) {
                                                SnackBar snack = const SnackBar(
                                                  content: Text('Deleted'),
                                                  backgroundColor: Colors.green,
                                                  duration: Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(snack);
                                              }).onError((error, stackTrace) {
                                                SnackBar errorSnack = SnackBar(
                                                  content: Text('Error :$error'),
                                                  backgroundColor: Colors.green,
                                                  duration: const Duration(seconds: 10),
                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(errorSnack);
                                                return null;
                                              });
                                            })
                                      ];
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
