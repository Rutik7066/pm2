import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pm/db/event_repo.dart';
import 'package:pm/model/event_modal.dart';
import 'package:pm/page/event/event_page.dart';
import 'package:pm/page/event/provider/calender_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalenderProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: StreamBuilder<List<EventModal>>(
          stream: EventRepo().listenToEvent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TableCalendar(
                              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                              shouldFillViewport: true,
                              firstDay: DateTime(2000, 1, 1),
                              lastDay: DateTime(2050, 1, 1),
                              calendarFormat: provider.calendarFormat,
                              focusedDay: provider.focusedDay ?? DateTime.now(),
                              onDaySelected: (selectedDay, focusedDay) => provider.onDaySelected(
                                selectedDay: selectedDay,
                                focusedDay: focusedDay,
                                list: snapshot.data ?? [],
                              ),
                              onFormatChanged: (format) => provider.onFormatChanged(format),
                              onPageChanged: (focusedDay) => provider.onPageChanged(focusedDay),
                              selectedDayPredicate: (day) => isSameDay(provider.selectedDay, day),
                              eventLoader: (day) {
                                return provider.getEventForDay(day: day, list: snapshot.data ?? []);
                              },
                              daysOfWeekHeight: 50,
                              headerStyle: HeaderStyle(headerMargin: EdgeInsets.zero, decoration: BoxDecoration(color: Colors.indigo.shade50)),
                              calendarBuilders: CalendarBuilders(
                                dowBuilder: (context, day) {
                                  if (day.weekday == DateTime.sunday) {
                                    final text = DateFormat.E().format(day);
                                    return Center(
                                      child: Text(
                                        text,
                                        style: textTheme.titleLarge!.copyWith(color: Colors.red.shade400),
                                      ),
                                    );
                                  } else {
                                    final text = DateFormat.E().format(day);
                                    return Center(
                                      child: Text(
                                        text,
                                        style: textTheme.titleLarge!.copyWith(color: Colors.black54),
                                      ),
                                    );
                                  }
                                },
                                markerBuilder: (context, day, events) {
                                  if (events.isNotEmpty) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                                      decoration: BoxDecoration(
                                        // border: Border.all(color: Colors.indigo.shade600, width: 0.2),
                                        color: Colors.indigo.shade50,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Text(
                                        '${events.length} Events',
                                        style: textTheme.titleSmall!.copyWith(color: Colors.indigo.shade600),
                                      ),
                                    );
                                  } else {
                                    return null;
                                  }
                                },
                                selectedBuilder: (context, day, focusedDay) {
                                  return Container(
                                    constraints: const BoxConstraints.expand(),
                                    decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        day.day.toString(),
                                        style: textTheme.bodyLarge,
                                      ),
                                    ),
                                  );
                                },
                                todayBuilder: (context, today, focusedDay) {
                                  if (isSameDay(today, focusedDay)) {
                                    return Container(
                                      constraints: const BoxConstraints.expand(),
                                      decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          today.day.toString(),
                                          style: textTheme.titleLarge,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      constraints: const BoxConstraints.expand(),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          today.day.toString(),
                                          style: textTheme.titleLarge,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.indigo.shade50,
                              child: Row(
                                children: [
                                  if (provider.focusedDay != null)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Event For ${DateFormat.yMMMEd().format(provider.focusedDay!)}',
                                        style: textTheme.headline6!.copyWith(color: Colors.indigo.shade500),
                                      ),
                                    )
                                  else
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Event',
                                        style: textTheme.headline6!.copyWith(color: Colors.indigo.shade500),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: provider.eventList.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListView.builder(
                                        itemCount: provider.eventList.length,
                                        itemBuilder: (context, index) {
                                          EventModal event = provider.eventList.elementAt(index);
                                          return ListTile(
                                            title: Text(event.title),
                                            subtitle: Text(event.customer.value?.name ?? ''),
                                            trailing: Text(TimeOfDay.fromDateTime(event.date).format(context)),
                                            onTap: () {
                                              provider.eventList.clear();
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return EventPage(id: event.id);
                                              }));
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  : Center(
                                      child: Text('Click on date to view event', style: textTheme.titleLarge),
                                    ),
                            ),
                          ],
                        ),
                      ))
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
