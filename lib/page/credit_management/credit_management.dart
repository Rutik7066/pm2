import 'package:flutter/material.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/db/customer_repo.dart';
import 'package:pm/db/transaction_repo.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/page/credit_management/customer_credit_page.dart';

import '../../common_widget/c_chip.dart';

class CreditManagement extends StatelessWidget {
  const CreditManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Credit Book',
              style: textTheme.headlineSmall,
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: CustomerRepo().listenTocustomer(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        CustomerModal customer = snapshot.data!.elementAt(index);
                        return ListTile(
                          title: Text(
                            customer.name,
                            style: textTheme.bodyLarge!.copyWith(color: customer.dues > 0 ? Colors.red : Colors.green),
                          ),
                          trailing: CChip(
                            needRuppe: true,
                            title: customer.dues.abs().toString(),
                            themeColor: customer.dues > 0 ? Colors.red : Colors.green,
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerCreditPage(id: customer.id),
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
