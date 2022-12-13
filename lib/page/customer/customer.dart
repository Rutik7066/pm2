import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/page/customer/customer_page.dart';
import '../customer/new_customer.dart';
import 'package:pm/page/customer/provider/customer_provider.dart';

class Customer extends StatelessWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customerProvider = Provider.of<CustomerProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Customer',
                    style: textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormTextField(
                      prefixIcon: const Icon(EvilIcons.search),
                      labelText: 'Enter Customer Name',
                      onChanged: (v) => customerProvider.setfilter(filter: v),
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(150, 35))),
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return const NewCustomer();
                        });
                  },
                  child: const Text('New Customer'),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder<List<CustomerModal>>(
                stream: customerProvider.getStreamedCustomer(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CustomerModal> customerList = snapshot.data ?? [];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionPanelList.radio(
                        elevation: 0,
                        expandedHeaderPadding: EdgeInsets.zero,
                        animationDuration: const Duration(milliseconds: 600),
                        children: List.generate(
                          customerList.length,
                          (index) {
                            CustomerModal customer = customerList.elementAt(index);
                            return ExpansionPanelRadio(
                              headerBuilder: (context, isOpen) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  customer.name,
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                              canTapOnHeader: true,
                              body: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: customer.dues <= 0 ? Colors.green.shade50 : Colors.red.shade50,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return CustomerPage(customerId: customer.id);
                                        },
                                      ),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Customer Number : ${customer.number}',
                                                  style: textTheme.bodyLarge,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                customer.dues > 0
                                                    ? Text(
                                                        'Customer Dues : \u20B9 ${customer.dues}',
                                                        style: textTheme.bodyLarge,
                                                      )
                                                    : Text(
                                                        'Customer Advance:  \u20B9 ${customer.dues.abs()}',
                                                        style: textTheme.bodyLarge,
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              value: customer,
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
