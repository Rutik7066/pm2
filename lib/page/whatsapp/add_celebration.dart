import 'package:flutter/material.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/celebration%20_repo.dart';
import 'package:pm/model/celebration_modal.dart';

import '../../common_widget/custom_text_input.dart';

class AddCelebration extends StatefulWidget {
  const AddCelebration({super.key});

  @override
  State<AddCelebration> createState() => _AddCelebrationState();
}

class _AddCelebrationState extends State<AddCelebration> {
  final formKey = GlobalKey<FormState>();
  CelebrationModal celebrationModal = CelebrationModal();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Celebration'),
      content: Form(
        key: formKey,
        child: SizedBox(
          height: 320,
          width: 270,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormTextField(
                labelText: "Customer Name",
                validator: (p) {
                  if (p == null || p.isEmpty) {
                    return "Enter customer name";
                  } else {
                    return null;
                  }
                },
                onSaved: (v) => celebrationModal.customer = v.toString(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormTextField(
                labelText: "Customer Number",
                validator: (p) {
                  if (p == null || p.isEmpty) {
                    return "Enter customer number";
                  } else {
                    return null;
                  }
                },
                onSaved: (v) => celebrationModal.number = v.toString(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormTextField(
                labelText: "Celebration Name",
                validator: (p) {
                  if (p == null || p.isEmpty) {
                    return "Enter name";
                  } else {
                    return null;
                  }
                },
                onSaved: (v) => celebrationModal.celebration = v.toString(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormTextField(
                      labelText: "Date",
                      validator: (p) {
                        if (p == null || p.isEmpty || int.tryParse(p) == null) {
                          return "Enter date";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (v) => celebrationModal.date = int.parse(v!),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormTextField(
                      labelText: "Month",
                      validator: (p) {
                        if (p == null || p.isEmpty || int.tryParse(p) == null) {
                          return "Enter month";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (v) => celebrationModal.month = int.parse(v!),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      actions: [
        ElevatedBtn(
          child: const Text('Add'),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              CelebrationRepo().addCelebration(celebrationModal).then((value) => Navigator.pop(context));
            }
          },
        )
      ],
    );
  }
}
