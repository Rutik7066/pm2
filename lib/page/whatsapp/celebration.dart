import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/db/celebration%20_repo.dart';
import 'package:pm/model/celebration_modal.dart';
import 'package:pm/page/whatsapp/add_celebration.dart';
import 'package:pm/util/whatsapp.dart';

class Celebration extends StatelessWidget {
  const Celebration({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: StreamBuilder<List<CelebrationModal>>(
          stream: CelebrationRepo().getCelebrationFromToday(),
          builder: (context, output) {
            if (output.hasData && output.data != null) {
              List<CelebrationModal> celebration = output.data!;
              return ListView.builder(
                itemCount: celebration.length,
                itemBuilder: (context, index) {
                  CelebrationModal cele = celebration[index];
                  return BorderContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    bordeColor: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: ListTile(
                      title: Text(
                        cele.customer,
                        style: textTheme.bodyLarge,
                      ),
                      subtitle: Text("Date : ${cele.date} , Event : ${cele.celebration}"),
                      trailing: TextButton.icon(
                          onPressed: () async {
                            String msg = "";
                            if (cele.celebration.toLowerCase().startsWith('wed')) {
                              msg = "Happy Wedding Aneversary ${cele.customer}";
                            } else if (cele.celebration.toLowerCase().startsWith('bir')) {
                              msg = "Happy Birthday ${cele.customer}";
                            }
                            await Whatsapp().createMessage(number: cele.number, message: msg);
                          },
                          icon: const Icon(Ionicons.logo_whatsapp),
                          label: const Text("Send Wish")),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return const AddCelebration();
              });
        },
        label: const Text("Add Celebration"),
        icon: const Icon(
          Ionicons.add_outline,
        ),
      ),
    );
  }
}
