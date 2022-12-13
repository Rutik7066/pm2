import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/bill_repo.dart';
import 'package:pm/model/bill_modal.dart';
import 'package:pm/page/bill/billImage.dart';
import 'package:routemaster/routemaster.dart';

class BillPage extends StatelessWidget {
  final BillModal? bill;
  const BillPage({super.key, this.bill});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BillImage(id: bill!.id, captureImage: false),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextBtn(
                            child: const Text('Back'),
                            onPressed: () => Routemaster.of(context).pop(),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton.icon(
                        icon: const Icon(
                          MaterialIcons.delete_outline,
                          size: 20,
                        ),
                        label: const Text('Delete'),
                        style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(120, 35))),
                        onPressed: () {
                          BillRepo().deleteBill(bill!.id);
                          Navigator.of(context).pop();
                          const delete = SnackBar(content: Text('Deleted successfully.'));
                          ScaffoldMessenger.of(context).showSnackBar(delete);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedBtn(
                        child: const Text('Download'),
                        onPressed: () async => await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: BillImage(
                              id: bill!.id,
                              captureImage: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
