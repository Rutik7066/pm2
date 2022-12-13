import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/product_repo.dart';
import 'package:pm/model/product_modal.dart';
import 'package:pm/page/product/new_product.dart';
import 'package:pm/page/product/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_text_input.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Product',
                    style: textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormTextField(
                      prefixIcon: const Icon(EvilIcons.search),
                      labelText: 'Enter Product Name',
                      onChanged: (v) => provider.changeFilter(v),
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(150, 35))),
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return const NewProduct();
                        });
                  },
                  child: const Text('New Product'),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                  stream: provider.listenToProduct(),
                  builder: (context, data) {
                    if (data.hasData && data.data != null) {
                      return ListView.builder(
                        itemCount: data.data!.length,
                        itemBuilder: (context, index) {
                          ProductModal product = data.data!.elementAt(index);
                          return ListTile(
                            title: Text(
                              product.name,
                              style: textTheme.bodyLarge,
                            ),
                            trailing: Text(
                              '\u20B9 ${product.price}',
                              style: textTheme.bodyLarge,
                            ),
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Product Detail'),
                                    content: SizedBox(
                                      width: 400,
                                      height: 300,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Product Name : ${product.name}', style: textTheme.bodyLarge),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Product Price : \u20B9 ${product.price}', style: textTheme.bodyLarge),
                                          ),
                                          if (product.element != null)
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('Product Desicription :', style: textTheme.bodyLarge),
                                            ),
                                          if (product.element != null)
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                                child: ListView.builder(
                                                  itemCount: product.element!.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    String e = product.element!.elementAt(index);
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text('${index + 1}. $e', style: textTheme.bodyLarge),
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                    actionsAlignment: MainAxisAlignment.spaceBetween,
                                    actions: [
                                      OutlinedBtn(
                                        child: const Text('Delete'),
                                        onPressed: () {
                                          ProductRepo().deleteProduct(product.id).then((value) {
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                      ElevatedBtn(
                                        child: const Text('Close'),
                                        onPressed: () => Navigator.pop(context),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
