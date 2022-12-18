import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/customer_repo.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/util/whatsapp.dart';

class Recovery extends StatelessWidget {
  const Recovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: CustomerRepo().getRecoveryList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CustomerModal> customerList = snapshot.data ?? [];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Cdatatable(
                    headingRowColor: Colors.indigo.shade50,
                    columns: [
                      DataColumn2(label: Text('#'), size: ColumnSize.S),
                      DataColumn2(label: Text('Customer Name'), size: ColumnSize.L),
                      DataColumn2(label: Text('Remaining Amount'), size: ColumnSize.M),
                      DataColumn2(label: Text(''), size: ColumnSize.M),
                    ],
                    row: List.generate(
                        customerList.length,
                        (index) => DataRow2.byIndex(cells: [
                              DataCell(Text("${index + 1}")),
                              DataCell(Text(customerList[index].name)),
                              DataCell(Text(customerList[index].dues.toString())),
                              DataCell(TextButton.icon(
                                  style: buttonStyle,
                                  icon: const Icon(
                                    Ionicons.logo_whatsapp,
                                    size: 15,
                                  ),
                                  onPressed: () async {
                                    String message = 'Hi ${customerList[index].name}.\nWe are here to inform you that \nyour payment of \u20A8 ${customerList[index].dues} is still pending. Kindly pay as soon as possible.\nTo get more information about this kindly visit the studio.';
                                    await Whatsapp().createMessage(number: customerList[index].number, message: message);
                                  },
                                  label: const Text('Notify'))),
                            ])),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
