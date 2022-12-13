import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:pm/common_widget/c_datatable.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/expense_repo.dart';
import 'package:pm/model/expense_modal.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: StreamBuilder(
          stream: ExpenseRepo().listenToExpense(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Expense',
                            style: textTheme.headlineSmall,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Cdatatable(
                        headingRowColor: Colors.indigo.shade50,
                        columns: const[
                          DataColumn2(label: Text('#')),
                          DataColumn2(label: Text('Date')),
                          DataColumn2(label: Text('Note')),
                          DataColumn2(label: Text('Amount')),
                        ],
                        row: List.generate(
                          snapshot.data!.length,
                          (index) {
                            ExpenseModal exp = snapshot.data!.reversed.elementAt(index);
                            return DataRow2.byIndex(
                              index:index,
                              cells: [
                                DataCell(Text('${index + 1}')),
                                DataCell(Text(DateFormat.yMMMd().format(exp.date))),
                                DataCell(Text(exp.title)),
                                DataCell(Text(exp.amount.toString())),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
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
                ExpenseModal exp = ExpenseModal();
                return Form(
                  key: formKey,
                  child: AlertDialog(
                    title: const Text('Add Expense'),
                    content: Container(
                      height: 160,
                      width: 100,
                      color: const Color.fromARGB(31, 175, 175, 175),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomFormTextField(
                              labelText: 'Amount',
                              validator: (v) {
                                double? amt = double.tryParse(v ?? '');
                                if (v == null || v.isEmpty || amt == null) {
                                  return 'Enter Amount';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (v) {
                                double? i = double.tryParse(v ?? '');
                                if (i != null) {
                                  exp.amount = i;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomFormTextField(
                              labelText: 'Note',
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Enter Note';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (v) {
                                if (v != null) {
                                  exp.title = v;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedBtn(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedBtn(
                          child: const Text('Add'),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              exp.date = DateTime.now();
                              ExpenseRepo().addExp(exp).then((value) => Navigator.pop(context));
                            }
                          },
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        label: const Text('Expense'),
        icon: const Icon(Ionicons.add),
      ),
    );
  }
}
