import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/page/quotation/provider/new_quotation_provider.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_text_input.dart';
import '../../db/customer_repo.dart';
import '../../db/product_repo.dart';
import '../../model/cart_item.dart';
import '../../model/customer_modal.dart';
import '../../model/product_modal.dart';
import '../customer/new_customer.dart';
import '../product/new_product.dart';

class NewQuotation extends StatefulWidget {
  const NewQuotation({super.key});

  @override
  State<NewQuotation> createState() => _NewQuotationState();
}

class _NewQuotationState extends State<NewQuotation> {
  final formKey = GlobalKey<FormState>();
  final productFormKey = GlobalKey<FormState>();
  final TextEditingController cName = TextEditingController();
  final TextEditingController cNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController rate = TextEditingController();
  final TextEditingController qty = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewQuotationProivder>(context);
    final textheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Cdatatable(
                headingRowColor: Colors.indigo.shade50,
                columns: const [
                  DataColumn2(label: Text('#'), fixedWidth: 50),
                  DataColumn2(label: Text('Product'), size: ColumnSize.L),
                  DataColumn2(label: Text('Rate'), size: ColumnSize.M),
                  DataColumn2(label: Text('Qty'), size: ColumnSize.M),
                  DataColumn2(label: Text('Total'), size: ColumnSize.M),
                  DataColumn2(label: Text(''), size: ColumnSize.S),
                ],
                row: List.generate(provider.cart.length, (index) {
                  CartItem item = provider.cart[index];
                  return DataRow2.byIndex(index: index, cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(Text(item.name)),
                    DataCell(Text(item.rate.toString())),
                    DataCell(Text(item.qty.toString())),
                    DataCell(Text(item.total.toString())),
                    DataCell(
                      IconButton(
                        onPressed: () => provider.removeFromCart(index),
                        icon: const Icon(MaterialCommunityIcons.delete_outline),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ),
          // const VerticalDivider(),
          Expanded(
            flex: 2,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Customer',
                          style: textheme.bodyLarge,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(150, 35))),
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return const NewCustomer();
                              });
                        },
                        child: const Text('New Customer'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomAutoCompleteTextFormField(
                      controller: cName,
                      itemBuilder: (context, c) {
                        return ListTile(title: Text(c.name));
                      },
                      onSuggestionSelected: (v) {
                        v as CustomerModal;
                        cName.text = v.name;
                        cNumber.text = v.number;
                        provider.customer = v;
                      },
                      suggestionsCallback: (b) async => await CustomerRepo().getCustomer(b),
                      label: 'Customer Name',
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Enter Customer Name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (b) {
                        provider.customerName = b.toString();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormTextField(
                      controller: cNumber,
                      labelText: 'Customer Number',
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Enter Customer Number";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (b) {
                        provider.customerNumber = b.toString();
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Product', style: textheme.bodyLarge),
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
                    ],
                  ),
                  Form(
                    key: productFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomAutoCompleteTextFormField(
                            controller: name,
                            itemBuilder: (context, c) {
                              c as ProductModal;
                              return ListTile(
                                title: Text(c.name),
                              );
                            },
                            onSuggestionSelected: (v) {
                              v as ProductModal;
                              name.text = v.name;
                              rate.text = v.price.toString();
                              provider.currentProduct = v;
                            },
                            suggestionsCallback: (b) => ProductRepo().getProduct(b),
                            label: 'Product Name',
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "Enter Product Name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomFormTextField(
                                  controller: rate,
                                  labelText: 'Product Price',
                                  validator: (v) {
                                    double? pr = double.tryParse(rate.text);
                                    if (pr == null) {
                                      return "Enter Product Price";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomFormTextField(
                                  controller: qty,
                                  labelText: 'Quantity',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 70, right: 8, top: 8, bottom: 8),
                              child: ElevatedButton(
                                style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(100, 35))),
                                onPressed: () {
                                  double? pr = double.tryParse(rate.text);
                                  int qt = int.tryParse(qty.text) ?? 1;

                                  if (pr != null && productFormKey.currentState!.validate()) {
                                    provider.addToCart(name: name.text, rate: pr, qty: qt);
                                    name.clear();
                                    qty.clear();
                                    rate.clear();
                                  }
                                },
                                child: const Text('Add'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: textheme.bodyLarge,
                        ),
                        Text(
                          "\u{20B9} ${provider.total}",
                          style: textheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormTextField(
                            prefixIcon: const Icon(
                              MaterialCommunityIcons.currency_inr,
                              size: 15,
                            ),
                            labelText: 'Discount',
                            validator: (p0) {
                              double? i = double.tryParse(p0.toString());
                              if (i == null && (p0 != null && p0.isNotEmpty)) {
                                return 'Enter Discount Amount';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (c) {
                              double? i = double.tryParse(c.toString());
                              if (i != null) {
                                provider.dis = i;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(100, 35))),
                          onPressed: () {},
                          child: const Text('Show'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(100, 35))),
                          onPressed: () {
                            if (provider.cart.isEmpty) {
                              SnackBar snack = const SnackBar(
                                backgroundColor: Colors.red,
                                elevation: 5,
                                // margin: EdgeInsets.all(8),
                                content: Text('Add Product to cart'),
                                behavior: SnackBarBehavior.floating,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snack);
                            } else {
                              provider.finalamt = provider.total - provider.dis;
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                provider.createQuote().then((value) {
                                  formKey.currentState!.reset();
                                  provider.clearAll();
                                  cName.clear();
                                  cNumber.clear();
                                });
                              }
                            }
                          },
                          child: const Text('Save'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
