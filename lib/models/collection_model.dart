import 'package:intl/intl.dart';
import 'package:uwalls/models/photo_model.dart';
import 'package:uwalls/models/users_model.dart';

class CollectionModel {

  final String id;
  final String title;
  final String description;
  final int totalPhoto;
  final UsersModel user;
  final PhotoModel cover;
  final DateTime created;
  final DateTime updated;

  const CollectionModel({
    required this.id,
    required this.title, 
    required this.description, 
    required this.totalPhoto, 
    required this.user, 
    required this.cover, 
    required this.created, 
    required this.updated
  });

  factory CollectionModel.fromJson({required Map<String, dynamic> json}) => CollectionModel(
    id: json['id'] ?? '-',
    title: json['title'] ?? '-',
    description: json['description'] ?? '-',
    totalPhoto: json['total_photos'],
    user: UsersModel.fromJson(json: json['user']),
    cover: PhotoModel.fromJson(json: json['cover_photo']),
    created: DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").tryParse(json['published_at']) ?? DateTime.now(),
    updated: DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").tryParse(json['updated_at']) ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'total_photos': totalPhoto,
    'user': user.toJson(),
    'cover_photo': cover.toJson(),
    'published_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(created),
    'updated_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(updated),
  };

}