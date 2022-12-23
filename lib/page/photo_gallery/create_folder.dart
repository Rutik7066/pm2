import 'dart:io';
import 'dart:isolate';

import 'package:clipboard/clipboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/db/customer_repo.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/page/photo_gallery/provider/create_folder_provider.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class CreateFolder extends StatefulWidget {
  const CreateFolder({super.key});

  @override
  State<CreateFolder> createState() => _CreateFolderState();
}

class _CreateFolderState extends State<CreateFolder> {
  @override
  void initState() {
    CreateFolderProvider().clearAll();
    super.initState();
  }

  Widget addWidget(CreateFolderProvider provider) {
    return SizedBox(
      child: InkWell(
        child: BorderContainer(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Center(
              child: Icon(
                Ionicons.add,
                size: 50,
                color: Colors.grey.shade700,
              ),
            )),
        onTap: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            allowCompression: true,
            allowMultiple: true,
            type: FileType.custom,
            lockParentWindow: false,
            allowedExtensions: ['jpg', 'jpeg'],
          );
          if (result != null) {
            provider.addImages(result.files);
          }
        },
      ),
    );
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController customController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Consumer<CreateFolderProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: textTheme.titleLarge!.copyWith(color: Colors.black),
          title: const Text('Create Folder'),
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
              onPressed: () {
                provider.clearAllWith();
                Routemaster.of(context).pop();
              },
              icon: const Icon(
                Ionicons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Column(
          children: [
            Form(
              key: formKey,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFormTextField(
                        labelText: 'Enter Title',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Enter Title";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (v) {
                          if (v != null && v.isNotEmpty) {
                            provider.title = v.replaceAll(" ", "");
                            ;
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAutoCompleteTextFormField(
                        controller: customController,
                        itemBuilder: (context, c) {
                          return ListTile(title: Text(c.name));
                        },
                        onSuggestionSelected: (v) {
                          v as CustomerModal;
                          if (v.name.isNotEmpty || v.number.isNotEmpty) {
                            customController.text = v.name;
                            provider.customer = v;
                          }
                        },
                        suggestionsCallback: (b) async => await CustomerRepo().getCustomer(b),
                        label: 'Select The Customer',
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "Select customer";
                          } else {
                            return null;
                          }
                        },
                        // onSaved: (v) {
                        //   if (v != null && v.isNotEmpty) {
                        //     // provider.title = v;
                        //   }
                        // },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: provider.images.isEmpty
                    ? InkWell(
                        child: Center(
                          child: Text(
                            'Click here to select image',
                            style: textTheme.displaySmall,
                          ),
                        ),
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            allowCompression: true,
                            allowMultiple: true,
                            lockParentWindow: false,
                          );
                          if (result != null) {
                            provider.addImages(result.files);
                          }
                        },
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: provider.compressingFile.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> map = provider.compressingFile[index];
                              return ListTile(
                                leading: Text((map['index'] + 1).toString()),
                                title: Text(map['name']),
                                trailing: Text(map['status']),
                              );
                            }),
                      ),
                // : LayoutBuilder(
                //     builder: (context, boxcontext) {
                //       var list = imageList(provider, textTheme);
                //       list.add(addWidget(provider));
                //       return GridView.count(
                //         crossAxisCount: boxcontext.maxWidth ~/ 150,
                //         childAspectRatio: 1 / 1,
                //         mainAxisSpacing: 8,
                //         crossAxisSpacing: 16,
                //         padding: const EdgeInsets.all(8),
                //         children: list,
                //       );
                //     },
                //   ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (provider.error != null)
                  // Error !
                  Expanded(
                    child: IndicatoFlag(
                      textTheme: textTheme,
                      color: Colors.red,
                      icon: Ionicons.close_circle,
                      label: provider.error.toString(),
                    ),
                  )
                else if (provider.uploadFlag == 0 && provider.qtyCompleted <= provider.images.length)
                  // Compressing...
                  Expanded(
                      child: LinearProgressIndicator(
                    color: Colors.indigo,
                    backgroundColor: Colors.indigo[200],
                    minHeight: 15,
                    value: provider.qtyCompleted / provider.images.length,
                  ))
                else if (provider.uploadFlag == 1 && provider.uploadTotal > 0)
                  // Uploading...
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            color: Colors.green,
                            backgroundColor: Colors.green[200],
                            minHeight: 15,
                            value: provider.uploadProgress / provider.uploadTotal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${provider.uploadProgress}/${provider.uploadTotal}',
                            style: textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  )
                else if (provider.uploadFlag == 2)
                  Expanded(
                    child: IndicatoFlag(
                      textTheme: textTheme,
                      color: Colors.green,
                      icon: Ionicons.checkmark_circle_outline,
                      label: 'Created Successfully',
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedBtn(
                    child: const Text('Clear All'),
                    onPressed: () async {
                      if (provider.images.isNotEmpty) {
                        provider.clearAllWith();
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedBtn(
                    child: const Text('Upload'),
                    onPressed: () async {
                      if (provider.images.isNotEmpty && formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (User.fromBox().credit >= provider.images.length) {
                          String? res = await provider.uploadMultipart();
                          if (res != null) {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    width: 700,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 650,
                                          child: Text(
                                            res,
                                            overflow: TextOverflow.ellipsis,
                                            style: textTheme.headline6!.copyWith(color: Colors.red),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => FlutterClipboard.copy(res),
                                          icon: const Icon(
                                            Ionicons.clipboard_outline,
                                          ),
                                          iconSize: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        } else {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  'Insufficient Credit',
                                  style: textTheme.headline6!.copyWith(color: Colors.red),
                                ),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> imageList(CreateFolderProvider provider, TextTheme textTheme) {
    return List.generate(provider.images.length, (index) {
      PlatformFile image = provider.images.elementAt(index);
      return Column(
        children: [
          if (image.path != null)
            Expanded(
              child: Image.file(
                File(image.path!),
                fit: BoxFit.contain,
              ),
            )
          else
            const Center(
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    image.name,
                    style: textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      provider.removeImage(index);
                    },
                    splashRadius: 20,
                    icon: const Icon(
                      Ionicons.close,
                      size: 15,
                    )),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class IndicatoFlag extends StatelessWidget {
  const IndicatoFlag({Key? key, required this.textTheme, required this.color, required this.icon, required this.label}) : super(key: key);

  final TextTheme textTheme;
  final MaterialColor color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label,
              style: textTheme.labelLarge!.copyWith(color: color),
            ),
          )
        ],
      ),
    );
  }
}
