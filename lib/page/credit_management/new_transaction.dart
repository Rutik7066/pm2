import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_text_input.dart';
import '../../common_widget/elevated_btn.dart';
import 'provider/new_transaction_provider.dart';

class NewTransaction extends StatefulWidget {
  final CustomerModal customer;
  const NewTransaction({super.key, required this.customer});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewTransactionProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(widget.customer.name),
      content: Form(
        key: formKey,
        child: Container(
          height: 280,
          width: 300,
          color: const Color.fromARGB(31, 175, 175, 175),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormTextField(
                  labelText: 'Amount',
                  prefixIcon: const Icon(MaterialCommunityIcons.currency_inr),
                  validator: (v) {
                    double? i = double.tryParse(v.toString());
                    if (v == null || v.isEmpty || i == null) {
                      return 'Enter Transaction Amount';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (v) {
                    double? i = double.tryParse(v ?? '');
                    if (i != null) {
                      provider.amt = i;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormTextField(
                  labelText: 'Note',
                  maxLines: 3,
                  minLines: 2,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Enter Transaction Note';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (v) {
                    if (v != null) {
                      provider.note = v;
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedBtn(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022, 1, 1),
                            lastDate: DateTime(2050, 1, 1),
                          );
                          if (pickedDate != null) {
                            provider.changeDate(pickedDate);
                          }
                        },
                        child: Text(
                          DateFormat.yMMMd().format(provider.date),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedBtn(
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            provider.chnageTime(pickedTime);
                          }
                        },
                        child: Text(
                          provider.time.format(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(const Size(100, 35)),
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          provider.credit(widget.customer);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Credit'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(const Size(100, 35)),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          provider.debit(widget.customer);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Debit'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        ElevatedBtn(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
