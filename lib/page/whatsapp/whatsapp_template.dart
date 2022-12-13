import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/page/whatsapp/add_template.dart';

import '../../db/whatsapp_temp_repo.dart';
import '../../model/whatsapp_temp_modal.dart';

class WhatsappTemplate extends StatelessWidget {
  const WhatsappTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Ionicons.add),
        onPressed: () async => await showDialog(
          context: context,
          builder: (context) => AddTemplate(),
        ),
        label: const Text('Template'),
      ),
      body: StreamBuilder(
          stream: WhatsappTempRepo().getWhatsappTemp(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<WhatsappModal> list = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(list[index].name),
                      trailing: IconButton(
                        iconSize: 10,
                        splashRadius: 10,
                        icon: const Icon(
                          Ionicons.trash_bin,
                          size: 20,
                        ),
                        onPressed: () async => await WhatsappTempRepo().deleteWhatsappTemp(list[index].id),
                      ),
                      onTap: () async => await showDialog(
                        context: context,
                        builder: (context) => AddTemplate(modal: list[index]),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
