import 'package:intl/intl.dart';
import 'package:uwalls/models/urls_model.dart';
import 'package:uwalls/models/users_model.dart';

class PhotoModel {

  final String id;
  final int width;
  final int height;
  final String slug;
  final String color;
  final String description;
  final String altDescription;
  final UrlsModel urls;
  final int likes;
  final int views;
  final int downloads;
  final UsersModel user;
  final DateTime created;
  final DateTime updated;
  DateTime? saved;
  DateTime? liked;

  PhotoModel({
    required this.id, 
    required this.width, 
    required this.height, 
    required this.slug, 
    required this.color, 
    required this.description, 
    required this.altDescription, 
    required this.urls, 
    required this.likes, 
    required this.views, 
    required this.downloads, 
    required this.user, 
    required this.created, 
    required this.updated,
    this.saved,
    this.liked,
  });

  factory PhotoModel.fromJson({required Map<String, dynamic> json}) => PhotoModel(
    id: json['id'] ?? '-',
    width: json['width'] ?? 0,
    height: json['height'] ?? 0,
    slug: json['slug'] ?? '-',
    color: json['color'] ?? '-',
    description: json['description'] ?? '-',
    altDescription: json['alt_description'] ?? '-',
    urls: UrlsModel.fromJson(json: json['urls']),
    likes: json['likes'] ?? 0,
    views: json['views'] ?? 0,
    downloads: json['downloads'] ?? 0,
    user: UsersModel.fromJson(json: json['user']),
    created: DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").tryParse(json['created_at']) ?? DateTime.now(),
    updated: DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").tryParse(json['updated_at']) ?? DateTime.now(),
    saved: DateTime.now(),
    liked: DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'width': width,
    'height': height,
    'slug': slug,
    'color': color,
    'description': description,
    'alt_description': altDescription,
    'urls': urls.toJosn(),
    'likes': likes,
    'views': views,
    'downloads': downloads,
    'user': user.toJson(),
    'created_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(created),
    'updated_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(updated),
    'saved_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(saved ?? DateTime.now()),
    'liked_at': DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(saved ?? DateTime.now()),
  };

  @override
  bool operator ==(Object other) {
    return other is PhotoModel && other.hashCode == hashCode;
  }

  @override
  int get hashCode => Object.hash(id, slug);

}