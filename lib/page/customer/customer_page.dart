import 'package:flutter/material.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/db/customer_repo.dart';
import 'package:pm/page/customer/customer_bill_tab.dart';
import 'package:pm/page/customer/customer_event_tab.dart';
import 'package:pm/page/customer/customer_transaction_tab.dart';

import 'edit_customer.dart';

class CustomerPage extends StatelessWidget {
  final int? customerId;
  const CustomerPage({super.key, this.customerId});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StreamBuilder<CustomerModal?>(
        stream: CustomerRepo().listenToSingleCustomer(customerId!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              CustomerModal customer = snapshot.data!;
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.indigo.shade400,
                  title: const Text(
                    'Customer Profile Page',
                  ),
                  actions: [
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: const Text('Edit'),
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return EditCustomer(customer: customer);
                              },
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: const Text('Delete'),
                          onTap: () async {
                            CustomerRepo().deleteCustomer(customer.id).then((value) {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                body: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Customer Name: ${customer.name}',
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Customer Number: ${customer.number}',
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: customer.dues > 0
                                    ? Text(
                                        'Customer Dues : \u20B9 ${customer.dues}',
                                        style: textTheme.bodyLarge,
                                      )
                                    : Text(
                                        'Customer Advance:  \u20B9 ${customer.dues.abs()}',
                                        style: textTheme.bodyLarge,
                                      ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 350,
                                  child: TabBar(tabs: [
                                    Tab(child: Text('Transaction', style: textTheme.bodyLarge)),
                                    Tab(child: Text('All Bill', style: textTheme.bodyLarge)),
                                    Tab(child: Text('All Event', style: textTheme.bodyLarge)),
                                  ]),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  CustomerTransactionTab(transactions: customer.transaction.toList()),
                                  CustomerBillTab(bills: customer.bill.toList()),
                                  CustomerEventTab(events: customer.event.toList()),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
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
        });
  }
}
