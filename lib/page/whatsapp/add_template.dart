import 'package:flutter/material.dart';

import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/whatsapp_temp_repo.dart';

import 'package:pm/model/whatsapp_temp_modal.dart';

class AddTemplate extends StatefulWidget {
  AddTemplate({super.key, this.modal});
  WhatsappModal? modal;

  @override
  State<AddTemplate> createState() => _AddTemplateState();
}

class _AddTemplateState extends State<AddTemplate> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? title = widget.modal?.name;
    String? temp = widget.modal?.message;
    return AlertDialog(
      content: SizedBox(
        width: 500,
        height: 300,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormTextField(
                  labelText: "Custom Message Title",
                  initialValue: title,
                  validator: (p) {
                    if (p == null || p.isEmpty) {
                      return "Enter Title";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (p) => title = p!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormTextField(
                  maxLines: 7,
                  minLines: 3,
                  labelText: "Message",
                  initialValue: temp,
                  validator: (p) {
                    if (p == null || p.isEmpty) {
                      return "Enter Message";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (p) => temp = p!,
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        ElevatedBtn(
          child: Text(widget.modal == null ? "Add" : "Update"),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              if (widget.modal != null) {
                widget.modal!.name = title ?? 'Whatsapp Template';
                widget.modal!.message = temp ?? 'Whatsapp Template';
                await WhatsappTempRepo().createWhatsappTemp(widget.modal!).then((value) {
                  Navigator.pop(context);
                });
              } else {
                WhatsappModal modal = WhatsappModal()
                  ..name = title ?? ''
                  ..message = temp ?? '';
                await WhatsappTempRepo().createWhatsappTemp(modal).then((value) {
                  Navigator.pop(context);
                });
              }
            }
          },
        ),
        TextBtn(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
