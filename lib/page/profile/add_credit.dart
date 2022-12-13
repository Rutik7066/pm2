import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/page/profile/provider/add_credit_provider.dart';
import 'package:provider/provider.dart';

class AddCredit extends StatefulWidget {
  const AddCredit({super.key, required this.planlist});
  final List planlist;

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddCreditProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 900,
      height: 500,
      child: Row(children: [
        Expanded(
            child: provider.loading == false
                ? Container(
                    child: provider.qrImage != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.memory(provider.qrImage!),
                                Text(
                                  'Selected Plan',
                                  style: textTheme.bodyLarge,
                                ),
                                ListTile(
                                  title: Text(provider.planMap!['name']),
                                  subtitle: Text(provider.planMap!['validity']),
                                  trailing: Text('\u20b9 ${provider.planMap!["credit"]}'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (provider.status != null && provider.status == false)
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.red.shade50,
                                            border: Border.all(color: Colors.red, width: 0.2, strokeAlign: StrokeAlign.inside),
                                            borderRadius: const BorderRadius.all(Radius.circular(3)),
                                          ),
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  MaterialIcons.sms_failed,
                                                  size: 15,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Payment Failed',
                                                  style: textTheme.bodyLarge!.copyWith(color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (provider.status != null && provider.status == true)
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade50,
                                            border: Border.all(color: Colors.green, width: 0.2, strokeAlign: StrokeAlign.inside),
                                            borderRadius: const BorderRadius.all(Radius.circular(3)),
                                          ),
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  MaterialIcons.check_circle_outline,
                                                  size: 20,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Payment Succesful',
                                                  style: textTheme.bodyLarge!.copyWith(color: Colors.green),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ElevatedBtn(
                                      child: Text('Validate'),
                                      onPressed: () async {
                                        await provider.validate();
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : Container())
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Credit Recharge Plan',
                  style: textTheme.titleLarge,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.planlist.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> plan = widget.planlist[index];
                    return BorderContainer(
                      color: provider.selected == index ? Colors.indigo : null,
                      child: ListTile(
                        title: Text(
                          '${plan['credit']} Credit',
                          style: textTheme.labelLarge!.copyWith(
                            color: provider.selected == index ? Colors.white : null,
                          ),
                        ),
                        trailing: Text(
                          '\u20b9 ${plan['price']}',
                          style: textTheme.labelLarge!.copyWith(
                            color: provider.selected == index ? Colors.white : null,
                          ),
                        ),
                        subtitle: Text(
                          'Valdity ${plan['validity']}',
                          style: textTheme.labelLarge!.copyWith(
                            color: provider.selected == index ? Colors.white : null,
                          ),
                        ),
                        onTap: () {
                          provider.changeSelected(index, plan);
                        },
                      ),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedBtn(
                        child: const Text('Pay Now'),
                        onPressed: () async {
                          await provider.addCreditQr();
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
