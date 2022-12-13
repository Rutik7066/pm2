import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pm/Authentication/AppProvider.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/page/profile/add_credit.dart';
import 'package:pm/page/profile/provider/add_credit_provider.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final auth = Provider.of<AppProvider>(context);
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box('dll12').listenable(),
        builder: (context, box, child) {
          User user = User.listenable(box);
          print(user.toString());
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Profile',
                      style: texttheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextBtn(
                      child: Text('Log Out'),
                      onPressed: ()async {
                        await auth.logOut();
                        
                      },
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey.shade200,
                      width: 200,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: user.logo != null
                            ? Column(
                                children: [
                                  Image.memory(user.logo!),
                                  TextButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                        const Size(150, 35),
                                      ),
                                    ),
                                    child: const Text('Change Profile'),
                                    onPressed: () async {
                                      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.image, withData: true);
                                      if (result != null) {
                                        PlatformFile image = result.files.first;
                                        await box.put('logo', image.bytes);
                                      }
                                    },
                                  )
                                ],
                              )
                            : InkWell(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Ionicons.person_add,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          'Click To Add Logo',
                                          style: texttheme.bodyLarge!.copyWith(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.image, withData: true);
                                  if (result != null) {
                                    PlatformFile image = result.files.first;
                                    await box.put('logo', image.bytes);
                                  }
                                },
                              ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Name : ${user.name}',
                          style: texttheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Number : ${user.number}',
                          style: texttheme.bodyLarge,
                        ),
                      ),
                      user.altnumber != null
                          ? Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Alternate Number: ${user.number}',
                                style: texttheme.bodyLarge,
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Email : ${user.email}',
                          style: texttheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Business Name : ${user.bussinessname}',
                          style: texttheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Business  Address : ${user.bussinessname}',
                          style: texttheme.bodyLarge,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Photo Gallery Credit : ${user.credit}',
                              style: texttheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextBtn(
                              child: const Text('Add Credit'),
                              onPressed: () async {
                                var re = await AddCreditProvider().getPlan();
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: AddCredit(planlist: re),
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Social Media',
                      style: texttheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextBtn(
                      child: const Text('Edit'),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            final fome = GlobalKey<FormState>();
                            return AlertDialog(
                              title: const Text('Social Media'),
                              content: Form(
                                key: fome,
                                child: SizedBox(
                                  width: 300,
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomFormTextField(
                                          prefixIcon: const Icon(
                                            Ionicons.logo_facebook,
                                          ),
                                          initialValue: user.fb,
                                          labelText: 'Facebook Id',
                                          onSaved: (v) async {
                                            String value = v ?? '';
                                            await box.put('fb_id', value);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomFormTextField(
                                          prefixIcon: const Icon(
                                            Ionicons.logo_instagram,
                                          ),
                                          initialValue: user.insta,
                                          labelText: 'Instagram Id',
                                          onSaved: (v) async {
                                            String value = v ?? '';
                                            await box.put('insta_id', value);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomFormTextField(
                                          prefixIcon: const Icon(
                                            Ionicons.md_logo_snapchat,
                                          ),
                                          initialValue: user.snap,
                                          labelText: 'Snap Id',
                                          onSaved: (v) async {
                                            String value = v ?? '';
                                            await box.put('snap_id', value);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomFormTextField(
                                          prefixIcon: const Icon(
                                            Ionicons.logo_youtube,
                                          ),
                                          initialValue: user.youtube,
                                          labelText: 'Youtube Id',
                                          onSaved: (v) async {
                                            String value = v ?? '';
                                            await box.put('youtube', value);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomFormTextField(
                                          prefixIcon: const Icon(
                                            Ionicons.earth,
                                          ),
                                          initialValue: user.web,
                                          labelText: 'Website',
                                          onSaved: (v) async {
                                            String value = v ?? '';
                                            await box.put('web', value);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedBtn(
                                  child: const Text('Save'),
                                  onPressed: () {
                                    if (fome.currentState!.validate()) {
                                      fome.currentState!.save();
                                      Navigator.pop(context);
                                      fome.currentState!.reset();
                                    }
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        if (user.youtube!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  MaterialCommunityIcons.youtube,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.youtube!,
                                    style: texttheme.bodyLarge,
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (user.insta!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Ionicons.logo_instagram,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.insta!,
                                    style: texttheme.bodyLarge,
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (user.fb!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Ionicons.logo_facebook,
                                  color: Colors.blueAccent,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.fb!,
                                    style: texttheme.bodyLarge,
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (user.snap!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Ionicons.logo_snapchat,
                                  size: 20,
                                  color: Colors.yellow.shade900,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.snap!,
                                    style: texttheme.bodyLarge,
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (user.web!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Ionicons.earth,
                                size: 20,
                                color: Colors.yellow.shade900,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  user.web!,
                                  style: texttheme.bodyLarge,
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ))
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
