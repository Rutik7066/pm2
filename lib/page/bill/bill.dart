import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class Bill extends StatelessWidget {
  const Bill({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tabPage = TabPage.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: TabBar(controller: tabPage.controller, tabs: [
              Tab(
                  child: Text(
                'New Bill',
                style: textTheme.bodyLarge,
              )),
              Tab(
                  child: Text(
                'All Bill',
                style: textTheme.bodyLarge,
              )),
            ]),
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
