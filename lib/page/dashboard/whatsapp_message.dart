import 'package:flutter/material.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/db/whatsapp_temp_repo.dart';
import 'package:pm/model/whatsapp_temp_modal.dart';
import 'package:pm/page/dashboard/provider/whatsapp_message_provider.dart';
import 'package:pm/util/whatsapp.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_text_input.dart';
import '../../common_widget/elevated_btn.dart';

class WhatsappMessage extends StatefulWidget {
  const WhatsappMessage({super.key, required this.list});
  final List<WhatsappModal> list;

  @override
  State<WhatsappMessage> createState() => _WhatsappMessageState();
}

class _WhatsappMessageState extends State<WhatsappMessage> {
 

  @override
  Widget build(BuildContext context) {
 
    return Consumer<WhatsappMessageProvider>(
      builder: (context, provider, child) => 
       AlertDialog(
        title: const Text('Whatsapp Message'),
        content: SizedBox(
          width: 400,
          height: 400,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormTextField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Enter Number";
                    } else {
                      return null;
                    }
                  },
                  labelText: 'Enter Number',
                  onChanged: (p0) {
                    provider.number = p0.toString();
                  },
                ),
              ),
              BorderContainer(
                padding: EdgeInsets.all(8),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    isDense: true,
                    isExpanded: true,
                    value: provider.modal,
                    hint: const Text('Select Message Template'),
                    items: widget.list
                        .map(
                          (event) => DropdownMenuItem(
                            value: event,
                            child: Text(event.name),
                          ),
                        )
                        .toList(),
                    onChanged: (o) {
                      print(widget.list.length);
    
                      provider.chnageModal(o);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          TextBtn(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.blue),
                fixedSize: MaterialStateProperty.all(const Size(150, 35)),
                // textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
              ),
              onPressed: () async {
                await Whatsapp().createMessage(
                  number: provider.number,
                  message: provider.modal?.message ?? '',
                );
              },
              child: const Text('Open Whatsapp'),
            ),
          ),
        ],
      ),
    );
  }
}
