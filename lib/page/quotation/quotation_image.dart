import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/bill_datatable.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/db/qotation_repo.dart';
import 'package:pm/model/cart_item.dart';
import 'package:pm/model/product_modal.dart';
import 'package:pm/model/quotation_modal.dart';
import 'package:pm/util/widget_to_image.dart';

import '../../util/util.dart';

class QuotationImage extends StatefulWidget {
  final int id;
  final bool captureImage;
  const QuotationImage({super.key, required this.id, required this.captureImage});

  @override
  State<QuotationImage> createState() => _QuotationImageState();
}

class _QuotationImageState extends State<QuotationImage> {
  late GlobalKey gkey;
  Future captureImage(BuildContext context, String customer) async {
    Future.delayed(const Duration(milliseconds: 800), () async {
      await Util.capture(gkey, customer);
    }).then((value) {
      Navigator.pop(context);
      SnackBar snack = const SnackBar(
        content: Text('Downloaded'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    });
  }

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    User user = User.fromBox();
    return WidgetToImage(
      builder: (key) {
        gkey = key;
        return StreamBuilder(
          stream: QuotationRepo().listenToQuoteById(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              QuotationModal quote = snapshot.data!;
              if (widget.captureImage) captureImage(context, quote.customer.value?.name ?? quote.finalamt.toString());
              // captureImage(context);
              return Container(
                margin: const EdgeInsets.all(5),
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BorderContainer(
                          height: 100,
                          width: 100,
                          child: AspectRatio(aspectRatio: 1 / 1, child: user.logo != null ? Image.memory(user.logo!) : const Text('Logo')),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        user.bussinessname,
                                        style: texttheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        'Quotation #${quote.id}',
                                        style: texttheme.bodyLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    user.bussinessadress,
                                    style: texttheme.titleSmall,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        'Mr. ${user.name}, Mob: ${user.number}, ${user.altnumber}',
                                        style: texttheme.titleSmall,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    if (user.youtube!.isNotEmpty)
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Icon(
                                              MaterialCommunityIcons.youtube,
                                              size: 15,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Text(
                                            user.youtube!,
                                            style: texttheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: Icon(
                                            Octicons.inbox,
                                            size: 15,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          user.email,
                                          style: texttheme.bodyLarge,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    if (user.insta!.isNotEmpty)
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Icon(
                                              Ionicons.logo_instagram,
                                              size: 15,
                                              color: Colors.pink,
                                            ),
                                          ),
                                          Text(
                                            user.insta!,
                                            style: texttheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    if (user.fb!.isNotEmpty)
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Icon(
                                              Ionicons.logo_facebook,
                                              size: 15,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                          Text(
                                            user.fb!,
                                            style: texttheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    if (user.snap!.isNotEmpty)
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Icon(
                                              Ionicons.logo_snapchat,
                                              size: 15,
                                              color: Colors.yellow.shade900,
                                            ),
                                          ),
                                          Text(
                                            user.snap!,
                                            style: texttheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          child: Text('Customer Name : ${quote.customer.value?.name}', style: texttheme.bodyLarge),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          child: Text('Customer Number : ${quote.customer.value?.number}', style: texttheme.bodyLarge),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          child: Text(DateFormat.yMMMMEEEEd().format(quote.created), style: texttheme.bodyLarge),
                        ),
                      ],
                    ),

                    Expanded(
                      child: BorderContainer(
                        child: Column(
                          children: [
                            const DataHeading(),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: quote.cart.length,
                                  itemBuilder: (context, index) {
                                    CartItem item = quote.cart.elementAt(index);
                                    ProductModal? product = item.product.value;
                                    return Column(
                                      children: [
                                        DataTitle(
                                          product: item.name,
                                          qty: item.qty.toString(),
                                          rate: item.rate.toString(),
                                          total: item.total.toString(),
                                        ),
                                        if (product != null && product.element != null)
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: product.element!.length,
                                            itemBuilder: (context, index) => Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                                              child: Text(
                                                product.element!.elementAt(index),
                                                style: texttheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                        Row(
                                          children: [Expanded(child: Container(height: 1, color: Colors.black12))],
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   children: [Expanded(child: Container(height: 1, color: Colors.black12))],
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 if (user.terms != null)
                                  Text(
                                    'Terms & Conditions*',
                                    style: texttheme.bodyLarge,
                                  ),
                                if (user.terms != null)
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      user.terms!,
                                      style: texttheme.bodySmall!.copyWith(color: Colors.black87),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Amt.',
                                          style: texttheme.bodyLarge,
                                        ),
                                        if (quote.dis > 0)
                                          Text(
                                            'Discount Amt.',
                                            style: texttheme.bodyLarge,
                                          ),
                                        Text(
                                          'Final Amt.',
                                          style: texttheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '\u{20B9} ${quote.total}',
                                          style: texttheme.bodyLarge,
                                        ),
                                        if (quote.dis > 0)
                                          Text(
                                            '\u{20B9} ${quote.dis}',
                                            style: texttheme.bodyLarge,
                                          ),
                                        Text(
                                          '\u{20B9} ${quote.finalamt}',
                                          style: texttheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50, right: 8, left: 8, bottom: 8),
                                      child: Text(
                                        'Customer Sign',
                                        style: texttheme.titleSmall,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 50, right: 8, left: 8, bottom: 8),
                                      child: Text(
                                        'Owner Sign',
                                        style: texttheme.titleSmall,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
