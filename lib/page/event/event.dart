import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final tabPage = TabPage.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 500,
                height: 50,
                child: TabBar(
                  controller: tabPage.controller,
                  tabs: [
                    Tab(
                      child: Text(
                        'All Event',
                        style: texttheme.bodyLarge,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Calender',
                        style: texttheme.bodyLarge,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'New Event',
                        style: texttheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabPage.controller,
              children: [
                for (final stack in tabPage.stacks) PageStackNavigator(stack: stack),
              ],
            ),
          )
        ],
      ),
    );
  }
}
