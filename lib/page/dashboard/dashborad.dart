import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/daily_repo.dart';
import 'package:pm/db/whatsapp_temp_repo.dart';
import 'package:pm/model/daily_modal.dart';
import 'package:pm/model/whatsapp_temp_modal.dart';
import 'package:pm/page/dashboard/provider/whatsapp_message_provider.dart';
import 'package:pm/page/dashboard/whatsapp_message.dart';
import 'package:pm/util/whatsapp.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final textheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Dashboard',
            style: textheme.headlineSmall,
          ),
        ), 
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(230, 35)),
                  ),
                  icon: const Icon(Ionicons.logo_whatsapp),
                  onPressed: () async {
                    WhatsappMessageProvider().clear();
                    List<WhatsappModal> list = await WhatsappTempRepo().listOfTemplate();
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return ChangeNotifierProvider(
                          create: (context) => WhatsappMessageProvider(),
                          child: WhatsappMessage(
                            list: list,
                          ),
                        );
                      },
                    );
                  },
                  label: const Text('Send Whatsapp Message'),
                )),
          ],
        ),
        Expanded(
          child: StreamBuilder(
              stream: DailyRepo().listenToDaily(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DailyModal> list = snapshot.data ?? [];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Cdatatable(
                      headingRowColor: Colors.indigo.shade50,
       
                      border: true,
                      columns: const [
                        DataColumn2(label: Text('Index')),
                        DataColumn2(label: Text('Date')),
                        DataColumn2(label: Text('Title')),
                        DataColumn2(label: Text('Amount')),
                      ],
                      row: List.generate(list.length, (index) {
                        DailyModal daily = list.elementAt(index);
                        String date = "${daily.time.day}/${daily.time.month}/${daily.time.year}";
                        return DataRow2.byIndex(index: index, cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(Text(date)),
                          DataCell(Text(daily.note)),
                          DataCell(Text('\u20b9 ${daily.amt}')),
                        ]);
                      }),
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
    ));
  }
}
