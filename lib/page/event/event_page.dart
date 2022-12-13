import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:pm/const.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/event_repo.dart';
import 'package:pm/model/event_modal.dart';
import 'package:pm/page/bill/billImage.dart';
import 'package:routemaster/routemaster.dart';

class EventPage extends StatelessWidget {
  final int? id;

  const EventPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;

    return Scaffold(
      body: StreamBuilder(
          stream: EventRepo().listenToSingleEvent(id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                EventModal event = snapshot.data!;
                return Row(
                  children: [
                    if (event.bill.value != null) BillImage(id: event.bill.value!.id, captureImage: false),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Event Details',
                                        style: texttheme.bodyLarge,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: TextBtn(
                                        child: const Text('Back'),
                                        onPressed: () => Routemaster.of(context).pop(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Event Title :',
                                        style: texttheme.labelLarge,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        event.title,
                                        style: texttheme.labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Event Date :',
                                        style: texttheme.labelLarge,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        DateFormat.yMMMMEEEEd().format(event.date),
                                        style: texttheme.labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Event Time :',
                                        style: texttheme.labelLarge,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        TimeOfDay.fromDateTime(event.date).format(context),
                                        style: texttheme.labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                if (event.des.isNotEmpty)
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Event Description',
                                          style: texttheme.labelLarge,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          event.des,
                                          style: texttheme.labelLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlinedButton.icon(
                                    style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(130, 35))),
                                    icon: const Icon(
                                      MaterialIcons.delete_outline,
                                      size: 20,
                                    ),
                                    label: const Text('Delete'),
                                    onPressed: () async {
                                      await EventRepo().deleteEvent(event.id).then((value) {
                                        SnackBar snack = const SnackBar(
                                          content: Text('Deleted'),
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 2),
                                        );
                                        Navigator.of(context).pop();

                                        ScaffoldMessenger.of(context).showSnackBar(snack);
                                        return null;
                                      }).onError((error, stackTrace) {
                                        SnackBar errorSnack = SnackBar(
                                          content: Text('Error :$error'),
                                          backgroundColor: Colors.green,
                                          duration: const Duration(seconds: 10),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(errorSnack);
                                        return null;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedBtn(
                                    child: const Text('Download'),
                                    onPressed: () async => await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        content: BillImage(
                                          id: event.bill.value!.id,
                                          captureImage: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
