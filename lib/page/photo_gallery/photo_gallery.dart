import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pm/Authentication/user.dart';
import 'package:pm/common_widget/border_container.dart';
import 'package:pm/db/folder_repo.dart';

import 'package:pm/model/job_modal.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:pm/page/photo_gallery/folder_page.dart';
import 'package:pm/page/photo_gallery/provider/cloud_gallery_provider.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<CloudGalleryProvider>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Routemaster.of(context).push('/couldgallery/createfolder');
          },
          label: const Text('Create Folder'),
          icon: const Icon(MaterialIcons.add),
        ),
        body: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              if (snapshot.data == ConnectivityResult.none) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      MaterialCommunityIcons.signal,
                      size: 100,
                      color: Colors.grey,
                    ),
                    Text(
                      'Internet Not Found',
                      style: textTheme.headline6!.copyWith(color: Colors.grey),
                    )
                  ],
                ));
              } else {
                if (provider.reqCode == 1) {
                  return StreamBuilder(
                      stream: FolderRepo().listenToFolder(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<JobModal> folders = snapshot.data ?? [];
                          String total = folders.length.toString();
                          String folderOpened = folders.where((element) => element.status == 1).length.toString();
                          String folderSelected = folders.where((element) => element.status == 2).length.toString();
                          print(folders);
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Photo Gallery',
                                      style: textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                          
                                  Expanded(
                                    child: BorderContainer(
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              'Total Folder',
                                              style: textTheme.titleLarge!.copyWith(color: Colors.black54),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              total,
                                              style: textTheme.titleLarge!.copyWith(color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: BorderContainer(
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              'Folder Opened',
                                              style: textTheme.titleLarge!.copyWith(color: Colors.black54),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              folderOpened,
                                              style: textTheme.titleLarge!.copyWith(color: Colors.blue),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: BorderContainer(
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              'Folder Selected',
                                              style: textTheme.titleLarge!.copyWith(color: Colors.black54),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              folderSelected,
                                              style: textTheme.titleLarge!.copyWith(color: Colors.green),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (context, boxcontext) => GridView.count(
                                    crossAxisCount: boxcontext.maxWidth ~/ 170,
                                    childAspectRatio: 1 / 1,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 16,
                                    padding: const EdgeInsets.all(8),
                                    children: List.generate(folders.length, (index) {
                                      JobModal folder = folders.elementAt(index);
                                      return BorderContainer(
                                        width: 170,
                                        child: InkWell(
                                          splashFactory: InkRipple.splashFactory,
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => FolderPage(
                                                  folderId: folder.id,
                                                  backendId: folder.backendId,
                                                ),
                                              )),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: folder.images.isNotEmpty
                                                    ? Image(
                                                        filterQuality: FilterQuality.high,
                                                        image: AdvancedNetworkImage(
                                                          folder.images.first.url,
                                                          fallbackAssetImage: 'assets/pngLogo.png',
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
                                                      )
                                                    : Container(),
                                              ),
                                              const Divider(),
                                              Container(
                                                padding: const EdgeInsets.all(5),
                                                child: Text(
                                                  folder.awsId,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      });
                } else if (provider.reqCode == 2) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        MaterialCommunityIcons.signal,
                        size: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        'Internet Not Found',
                        style: textTheme.headline6!.copyWith(color: Colors.grey),
                      )
                    ],
                  ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            }));
  }

  Future<Uint8List?> getImage(String url) async {
    var request = await http.get(Uri.parse(url));
    if (request.statusCode == 200) {
      return request.bodyBytes;
    } else {
      print(request.reasonPhrase);
      return null;
    }
  }
}
