class UsersModel {

  final String id;
  final String username;
  final AvatarModel avatar;
  final String name;
  final String bio;
  final String location;
  final String portfolio;
  final int collections;
  final int likes;
  final int photos;
  final int illustrations;

  const UsersModel({
    required this.id, 
    required this.username, 
    required this.avatar, 
    required this.name, 
    required this.bio, 
    required this.location, 
    required this.portfolio, 
    required this.collections, 
    required this.likes, 
    required this.photos, 
    required this.illustrations
  });

  factory UsersModel.fromJson({required Map<String, dynamic> json}) => UsersModel(
    id: json['id'] ?? '-',
    username: json['username'] ?? '-',
    avatar: AvatarModel.fromJson(json: json['profile_image']),
    name: json['name'] ?? '-',
    bio: json['bio'] ?? '-',
    location: json['location'] ?? '-',
    portfolio: json['portfolio_url'] ?? '-',
    collections: json['total_collections'] ?? 0,
    likes: json['total_likes'] ?? 0,
    photos: json['total_photos'] ?? 0,
    illustrations: json['total_illustrations'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'profile_image': avatar.toJson(),
    'name': name,
    'bio': bio,
    'location': location,
    'portfolio_url': portfolio,
    'total_collections': collections,
    'total_likes': likes,
    'total_photos': photos,
    'total_illustrations': illustrations,
  };

}

class AvatarModel {

  final String small;
  final String medium;
  final String large;

  const AvatarModel({
    required this.small, 
    required this.medium, 
    required this.large
  });

  factory AvatarModel.fromJson({required Map<String, dynamic> json}) => AvatarModel(
    small: json['small'] ?? '-', 
    medium: json['medium'] ?? '-', 
    large: json['large'] ?? '-',
  );

  Map<String, dynamic> toJson() => {
    'small': small,
    'medium': medium,
    'large': large,
  };

}

