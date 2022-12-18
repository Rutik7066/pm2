import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/db/event_repo.dart';
import 'package:pm/model/event_modal.dart';
import 'package:pm/page/event/event_page.dart';
import 'package:pm/page/event/provider/all_event_provider.dart';
import 'package:provider/provider.dart';

import '../../db/bill_repo.dart';
import '../../util/whatsapp.dart';
import '../bill/billImage.dart';

class AllEvent extends StatelessWidget {
  const AllEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllEventProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ChoiceChip(
                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  label: const Text('All Event'),
                  selected: provider.list[0] == true,
                  onSelected: (b) => provider.toggle(index: 0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ChoiceChip(
                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  label: const Text('Old Event'),
                  selected: provider.list[1] == true,
                  onSelected: (b) => provider.toggle(index: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ChoiceChip(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  label: const Text('Upcomming Event'),
                  padding: EdgeInsets.zero,
                  selected: provider.list[2] == true,
                  onSelected: (b) => provider.toggle(index: 2),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                  stream: provider.eventList(),
                  builder: (context, snapshot) {
                    List<EventModal> eventList = snapshot.data ?? [];
                    if (snapshot.hasData) {
                      return Cdatatable(
                        headingRowColor: Colors.indigo.shade50,
                        columns: const [
                          DataColumn2(label: Text('Index')),
                          DataColumn2(label: Text('Date')),
                          DataColumn2(label: Text('Title')),
                          DataColumn2(label: Text('Customer')),
                          DataColumn2(label: Text('Final')),
                          DataColumn2(label: Text('Paid')),
                          DataColumn2(label: Text('')),
                        ],
                        row: List.generate(eventList.length, (index) {
                          EventModal event = eventList[index];
                          String date = '${event.date.day}/${event.date.month}/${event.date.year}';
                          return DataRow2.byIndex(
                            index: index,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventPage(
                                    id: eventList[index].id,
                                  ),
                                ),
                              );
                            },
                            cells: [
                              DataCell(Text('${index + 1}')),
                              DataCell(Text(date)),
                              DataCell(Text(eventList[index].title)),
                              DataCell(Text(eventList[index].customer.value!.name)),
                              DataCell(Text(eventList[index].bill.value!.finalamt.toString())),
                              DataCell(Text(eventList[index].bill.value!.paid.toString())),
                              DataCell(
                                PopupMenuButton(
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                          child: const Text('Download Bill'),
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                content: BillImage(
                                                  id: event.bill.value!.id,
                                                  captureImage: true,
                                                ),
                                              ),
                                            );
                                          }),
                                      PopupMenuItem(
                                          child: const Text('Send Bill'),
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                content: BillImage(
                                                  id: event.bill.value!.id,
                                                  captureImage: true,
                                                ),
                                              ),
                                            );
                                            String message = "Hi ${event.bill.value!.customer.value!.name} \nThank You so much for visiting ${User.fromBox().bussinessname}.\nWe are happy to have you.";
                                            await Whatsapp().createMessage(number: event.bill.value!.customer.value!.number, message: message);
                                          }),
                                      PopupMenuItem(
                                          child: const Text('Delete Event'),
                                          onTap: () async {
                                            await EventRepo().deleteEvent(event.bill.value!.id).then((value) {
                                              SnackBar snack = const SnackBar(
                                                content: Text('Event Deleted'),
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
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ), // 100
          )
        ],
      ),
    );
  }
}
