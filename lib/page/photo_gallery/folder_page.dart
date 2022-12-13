import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/db/folder_repo.dart';
import 'package:pm/model/job_image_modal.dart';
import 'package:pm/model/job_modal.dart';
import 'package:pm/page/photo_gallery/provider/folder_page_provider.dart';
import 'package:provider/provider.dart';

class FolderPage extends StatefulWidget {
  final int? folderId;
  final int? backendId;

  const FolderPage({super.key, this.folderId, this.backendId});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    late JobModal folder;
    final texttheme = Theme.of(context).textTheme;
    final provider = Provider.of<FolderPageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Folder',
          style: texttheme.titleLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Ionicons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: PopupMenuButton(
              splashRadius: 20,
              icon: const Icon(
                MaterialCommunityIcons.dots_vertical,
                color: Colors.black,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  height: 25,
                  child: const Text('Delete'),
                  onTap: () async {
                    var re = await provider.deleteFolder(
                        folderId: widget.backendId!);
                    if (re) {
                      await FolderRepo().deleteFolder(widget.folderId!);
                      Navigator.pop(context);
                    } else {
                      SnackBar snack = const SnackBar(
                        backgroundColor: Colors.red,
                        elevation: 5,
                        // margin: EdgeInsets.all(8),
                        content: Text('Failed To Delete'),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    }
                  },
                ),
                PopupMenuItem(
                  height: 25,
                  child: const Text('Get Link'),
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Folder Link'),
                            content: SizedBox(
                              height: 100,
                              width: 300,
                              child: CustomFormTextField(
                                labelText: '',
                                initialValue:
                                    "https://photographymanager.in/photogallery?uid=${User.fromBox().uid}&folder=${folder.awsId}",
                              ),
                            ),
                            actions: [
                              ElevatedBtn(
                                child: const Text('Close'),
                                onPressed: () => Navigator.pop(context),
                              )  
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: StreamBuilder(
          stream: FolderRepo().getFolderById(widget.folderId!),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              folder = snapshot.data!;
              String status = '';
              if (folder.status == 0) {
                status = "Not Opened";
              } else if (folder.status == 1) {
                status = "Opened";
              } else if (folder.status == 2) {
                status = "Selection Done";
              }
              return Column(
                children: [
                  BorderContainer(
                    padding: const EdgeInsets.all(8),
                    borderRadius: BorderRadius.circular(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Folder Status : $status',
                              style: texttheme.titleSmall,
                            ),
                            Text(
                              'Total Image : ${folder.images.length}',
                              style: texttheme.titleSmall,
                            ),
                            Text(
                              'Total Image Selected : ${folder.images.where((element) => element.isSelected == true).length}',
                              style: texttheme.titleSmall,
                            ),
                          ],
                        ),
                        if (folder.status == 2)
                          TextBtn(
                            child: const Text('Copy'),
                            onPressed: () async {
                              String? res =
                                  await FilePicker.platform.getDirectoryPath();
                              if (res == null) return;
                              List<JobImageModal> selectedImages = folder.images
                                  .where(
                                      (element) => element.isSelected == true)
                                  .toList();
                              await provider.copyImage(selectedImages, res);
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        width: 200,
                                        height: 50,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:
                                          provider.imageCopyed != provider.totalImageToCopy ? 
                                           [
                                            
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Copy started',
                                                  style: texttheme.titleLarge,
                                                ),
                                              ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${provider.imageCopyed}/${provider.totalImageToCopy}',
                                                style: texttheme.titleMedium,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: LinearProgressIndicator(
                                                  color: Colors.indigo,
                                                  backgroundColor:
                                                      Colors.indigo.shade200),
                                            )  
                                          ] : [
                                              Center(
                                                child: Row(
                                                  mainAxisAlignment:  MainAxisAlignment.center,
                                                  crossAxisAlignment:CrossAxisAlignment.center, 
                                                    children: [
                                            Icon(Ionicons.checkmark_circle, color: Colors.green, size: 25,),

                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'Copying Completed',
                                                        style: texttheme.titleLarge!.copyWith(color: Colors.green),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),



                                          ]
                                        ),
                                      ),
                                    );
                                  });
                            },
                          )
                        else
                          TextBtn(
                            child: const Text('Add Image'),
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                allowCompression: true,
                                allowMultiple: true,
                                type: FileType.custom,
                                lockParentWindow: false,
                                allowedExtensions: ['jpg', 'jpeg'],
                              );
                              if (result != null) {
                                provider
                                    .addImage(
                                        images: result.files,
                                        uid: User.fromBox().uid.toString(),
                                        folder: folder)
                                    .then((re) {
                                  if (re) {
                                    SnackBar snack = const SnackBar(
                                      backgroundColor: Colors.green,
                                      elevation: 5,
                                      // margin: EdgeInsets.all(8),
                                      content: Text('Uploaded Succesfully'),
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snack);
                                  } else {
                                    SnackBar snack = const SnackBar(
                                      backgroundColor: Colors.red,
                                      elevation: 5,
                                      // margin: EdgeInsets.all(8),
                                      content: Text('Failed To Upload'),
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snack);
                                  }
                                });
                              }
                            },
                          )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: MediaQuery.of(context).size.width ~/ 180,
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                      padding: const EdgeInsets.all(8),
                      children: folder.images.map((image) {
                        return Column(
                          children: [
                            Expanded(
                              child: Image(
                                filterQuality: FilterQuality.high,
                                image: AdvancedNetworkImage(
                                  image.url,
                                  width: 150,
                                  useDiskCache: true,
                                  cacheRule: const CacheRule(
                                      maxAge: Duration(days: 7)),
                                ),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Ionicons.image_outline,
                                      size: 30,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 25,
                                        width: 130,
                                        child: Text(image.name,
                                            overflow: TextOverflow.ellipsis)),
                                    image.isSelected
                                        ? Text(
                                            'Selected',
                                            style: texttheme.bodyLarge!
                                                .copyWith(color: Colors.green),
                                          )
                                        : Text(
                                            'Unselected',
                                            style: texttheme.bodyLarge!
                                                .copyWith(color: Colors.red),
                                          ),
                                  ],
                                ),
                                // PopupMenuButton(
                                //   splashRadius: 20,
                                //   icon: const Icon(
                                //     MaterialCommunityIcons.dots_vertical,
                                //     color: Colors.black,
                                //   ),
                                //   itemBuilder: (context) => [
                                //     PopupMenuItem(
                                //       height: 25,
                                //       child: const Text('Delete'),
                                //       onTap: () {
                                //         provider.deleteImage(uid: User.fromBox().uid.toString(), folderId: widget.backendId!, image: image).then((re) {
                                //           if (!re) {
                                //             SnackBar snack = const SnackBar(
                                //               backgroundColor: Colors.red,
                                //               elevation: 5,
                                //               // margin: EdgeInsets.all(8),
                                //               content: Text('Failed To Delete'),
                                //               behavior: SnackBarBehavior.floating,
                                //             );
                                //             ScaffoldMessenger.of(context).showSnackBar(snack);
                                //           }
                                //         });
                                //       },
                                //     ),
                                //   ],
                                // ),
                              ],
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
