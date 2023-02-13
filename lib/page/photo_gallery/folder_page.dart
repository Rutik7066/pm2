import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/common_widget/elevated_btn.dart';
import 'package:pm/common_widget/custom_text_input.dart';
import 'package:pm/model/folder_image.dart';
import 'package:pm/page/photo_gallery/provider/folder_page_provider.dart';
import 'package:pm/pb.dart';
import 'package:pm/util/util.dart';
import 'package:provider/provider.dart';

class FolderPage extends StatefulWidget {
  final String? folderId;

  const FolderPage({
    super.key,
    this.folderId,
  });

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    late FolderModal folder;
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
                    try {
                      pb.collection('folder').delete(widget.folderId!).whenComplete(() {
                        Navigator.pop(context);
                      });
                    } catch (e) {
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
                                initialValue: "https://photographymanager.in/photogallery?id=${widget.folderId}",
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
      body: FutureBuilder(
          future: pb.collection('folder').getOne(
                widget.folderId.toString(),
                expand: 'images',
              ),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              folder = FolderModal.fromJson(snapshot.data!.toJson());
              String status = '';
              if (folder.status == "0") {
                status = "Not Opened";
              } else if (folder.status == "1") {
                status = "Opened";
              } else if (folder.status == "2") {
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
                              'Total Image Selected : ${folder.expand.images.where((element) => element.isSelected == true).length}',
                              style: texttheme.titleSmall,
                            ),
                          ],
                        ),
                        TextBtn(
                          child: const Text('Copy'),
                          onPressed: () async {
                            String? res = await FilePicker.platform.getDirectoryPath();
                            if (res == null) return;
                            List<ImageModal> selectedImages = folder.expand.images.where((element) => element.isSelected == true).toList();
                            await provider.copyImage(selectedImages, res);
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: SizedBox(
                                      width: 200,
                                      height: 50,
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: provider.imageCopyed != provider.totalImageToCopy
                                              ? [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Copy started',
                                                      style: texttheme.titleLarge,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      '${provider.imageCopyed}/${provider.totalImageToCopy}',
                                                      style: texttheme.titleMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: LinearProgressIndicator(color: Colors.indigo, backgroundColor: Colors.indigo.shade200),
                                                  )
                                                ]
                                              : [
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Ionicons.checkmark_circle,
                                                          color: Colors.green,
                                                          size: 25,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            'Copying Completed',
                                                            style: texttheme.titleLarge!.copyWith(color: Colors.green),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                    ),
                                  );
                                });
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
                      children: folder.expand.images.map((image) {
                        return Column(
                          children: [
                            Expanded(
                              child: Image(
                                filterQuality: FilterQuality.high,
                                image: AdvancedNetworkImage(
                                  getImageUrl(collectionId: folder.expand.images.first.collectionId, recordID: image.id, imageName: image.image, size: '0x0'),
                                  width: 150,
                                  useDiskCache: true,
                                  cacheRule: const CacheRule(maxAge: Duration(days: 7)),
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
                                    Container(height: 25, width: 130, child: Text(image.image, overflow: TextOverflow.ellipsis)),
                                    image.isSelected
                                        ? Text(
                                            'Selected',
                                            style: texttheme.bodyLarge!.copyWith(color: Colors.green),
                                          )
                                        : Text(
                                            'Unselected',
                                            style: texttheme.bodyLarge!.copyWith(color: Colors.red),
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
                                //         provider.deleteImage(id: User.fromBox().id.toString(), folderId: widget.backendId!, image: image).then((re) {
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
