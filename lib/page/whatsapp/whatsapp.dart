import 'package:flutter/material.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/util/whatsapp.dart' as wh;
import 'package:routemaster/routemaster.dart';

class Whatsapp extends StatelessWidget {
  const Whatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tabPage = TabPage.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 500,
            height: 50,
            child: TabBar(controller: tabPage.controller, tabs: [
              Tab(
                child: Text(
                  'Recovery',
                  style: textTheme.bodyLarge,
                ),
              ),
              Tab(
                child: Text(
                  'Celebration',
                  style: textTheme.bodyLarge,
                ),
              ),
              Tab(
                child: Text(
                  'Whatsapp Template',
                  style: textTheme.bodyLarge,
                ),
              )
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
