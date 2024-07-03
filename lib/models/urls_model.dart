

class UrlsModel {

  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  const UrlsModel({
    required this.raw, 
    required this.full, 
    required this.regular, 
    required this.small, 
    required this.thumb,
  });

  factory UrlsModel.fromJson({required Map<String, dynamic> json}) => UrlsModel(
    raw: json['raw'] ?? '-',
    full: json['full'] ?? '-',
    regular: json['regular'] ?? '-',
    small: json['small'] ?? '-',
    thumb: json['thumb'] ?? '-',
  );

  Map<String, dynamic> toJosn() => {
    'raw': raw,
    'full': full,
    'regular': regular,
    'small': small,
    'thumb': thumb,
  };

}