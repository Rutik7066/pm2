import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/page/product/provider/new_product_provider.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_text_input.dart';
import '../../common_widget/elevated_btn.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textheme = Theme.of(context).textTheme;
    final provider = Provider.of<NewProductProivder>(context);

    return AlertDialog(
      content: Container(
        height: 450,
        width: 500,
        color: const Color.fromARGB(31, 175, 175, 175),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Product Details', style: textheme.titleLarge),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFormTextField(
                        labelText: 'Product Name',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Enter Product Name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (v) {
                          if (v != null && v.isNotEmpty) {
                            provider.productName = v;
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFormTextField(
                        labelText: 'Product Price',
                        validator: (value) {
                          double? v = double.tryParse(value.toString());
                          if (v == null) {
                            return 'Enter Product Price';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (b) {
                          double? v = double.tryParse(b.toString());
                          if (v != null) {
                            provider.productPrice = v;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFormTextField(labelText: 'Description', controller: desController),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedBtn(
                      child: const Text('Add'),
                      onPressed: () {
                        provider.addDes(desController.text);
                        desController.clear();
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: provider.desList.length,
                    itemBuilder: (context, index) {
                      String des = provider.desList[index];
                      return BorderContainer(
                        margin: const EdgeInsets.all(1),
                        child: ListTile(
                          title: Text(des),
                          trailing: IconButton(
                            icon: const Icon(
                              MaterialCommunityIcons.delete_outline,
                            ),
                            onPressed: () {
                              provider.removeDes(index);
                            },
                          ),
                        ),
                      );
                    }),
              ))
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedBtn(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedBtn(
            child: const Text('Save'),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                provider.addProduct();
                formKey.currentState!.reset();
                Navigator.pop(context);
              }
            },
          ),
        )
      ],
    );
  }
}
