class Video {
  final String id;
  final String title;
  final String description;
  final String url;
  final DateTime uploadDate;

  Video({required this.id, required this.title, required this.description, required this.url, required this.uploadDate});

  // Method to convert JSON to Video object
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      uploadDate: DateTime.parse(json['uploadDate']),
    );
  }

  // Method to convert Video object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'url': url,
      'uploadDate': uploadDate.toIso8601String(),
    };
  }
}