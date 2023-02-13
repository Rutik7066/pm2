import 'package:pocketbase/pocketbase.dart';

List<FolderModal> convertRecordToFolder(List<RecordModel> rec) {
  List<FolderModal> i = [];
  for (var r in rec) {
    i.add(FolderModal.fromJson(r.toJson()));
  }
  return i;
}

class FolderModal {
  final String id;
  final String title;

  final String created;
  final String updated;
  final String collectionId;
  final String collectionName;
  final Expand expand;
  final String customerid;
  final List<String> images;
  final String length;
  final String status;
  final String user;

  FolderModal({
    required this.id,
    required this.title,
    required this.created,
    required this.updated,
    required this.collectionId,
    required this.collectionName,
    required this.expand,
    required this.customerid,
    required this.images,
    required this.length,
    required this.status,
    required this.user,
  });

  factory FolderModal.fromJson(Map<String, dynamic> json) {
    return FolderModal(
      id: json['id'],
      title: json['title'],
      created: json['created'],
      updated: json['updated'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      expand: Expand.fromJson(json['expand']),
      customerid: json['customerid'],
      images: List<String>.from(json['images']),
      length: json['length'],
      status: json['status'],
      user: json['user'],
    );
  }
}

class Expand {
  final List<ImageModal> images;

  Expand({
    required this.images,
  });

  factory Expand.fromJson(Map<String, dynamic> json) {
    var list = json['images'] as List;
    List<ImageModal> imagesList = list.map((i) => ImageModal.fromJson(i)).toList();
    return Expand(
      images: imagesList,
    );
  }
}

class ImageModal {
  final String id;
  final String created;
  final String updated;
  final String collectionId;
  final bool isSelected;
  final String collectionName;
  final dynamic expand;
  final String image;
  final String localurl;

  ImageModal({
    required this.id,
    required this.created,
    required this.updated,
    required this.isSelected,
    required this.collectionId,
    required this.collectionName,
    required this.expand,
    required this.image,
    required this.localurl,
  });

  factory ImageModal.fromJson(Map<String, dynamic> json) {
    return ImageModal(
      id: json['id'],
      isSelected: json['isSelected'],
      created: json['created'],
      updated: json['updated'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      expand: json['expand'],
      image: json['image'],
      localurl: json['localurl'],
    );
  }
}
