import 'package:flutter/material.dart';
import 'package:pm/db/customer_repo.dart';

import '../../common_widget/custom_text_input.dart';
import '../../common_widget/elevated_btn.dart';
import '../../model/customer_modal.dart';

class EditCustomer extends StatefulWidget {
  final CustomerModal customer;
  const EditCustomer({super.key, required this.customer});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textheme = Theme.of(context).textTheme;
    String custmerName = '';
    String custmerNumber = '';
    double custmerdues = 0.0;
    return AlertDialog(
      title: Text(
        'Customer Details',
        style: textheme.titleLarge,
      ),
      content: Container(
        height: 285,
        width: 300,
        color: const Color.fromARGB(31, 175, 175, 175),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormTextField(
                  initialValue: widget.customer.name,
                  labelText: 'Customer Name',
                  onSaved: (p0) {
                    if (p0 != null) {
                      custmerName = p0;
                    }
                  },
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Enter Customer Name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormTextField(
                  initialValue: widget.customer.number,
                  labelText: 'Customer Number',
                  onSaved: (p0) {
                    if (p0 != null) {
                      custmerNumber = p0;
                    }
                  },
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Enter Customer Number";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormTextField(
                  initialValue: widget.customer.dues.toString(),
                  labelText: 'Customer Dues',
                  onSaved: (p0) {
                    if (p0 != null) {
                      double? i = double.tryParse(p0);
                      if (i != null) {
                        custmerdues = i;
                      }
                    }
                  },
                  validator: (v) {
                    double? d = double.tryParse(v.toString());
                    if (d == null && v!.isNotEmpty) {
                      return "Enter Dues Amount";
                    } else {
                      return null;
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedBtn(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedBtn(
            child: const Text('Save'),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                widget.customer
                  ..name = custmerName
                  ..number = custmerNumber
                  ..dues = custmerdues;
                CustomerRepo().createCustomer(widget.customer).then((value) {
                  Navigator.of(context).pop();
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
