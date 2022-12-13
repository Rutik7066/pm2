import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:routemaster/routemaster.dart';

class Quotation extends StatelessWidget {
  const Quotation({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tabpage = TabPage.of(context);
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 300,
                child: TabBar(controller: tabpage.controller, tabs: [
                  Tab(
                    child: Text('All Quotation', style: textTheme.bodyLarge),
                  ),
                  Tab(
                    child: Text('New Quotation', style: textTheme.bodyLarge),
                  )
                ]),
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabpage.controller,
              children: [
                for (final stack in tabpage.stacks) PageStackNavigator(stack: stack),
              ],
            ),
          )
        ],
      ),
    );
  }
}
