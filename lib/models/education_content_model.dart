class EducationContent {
  final String? title;
  final String? content;
  final String? image;
  final String? category;

  EducationContent({this.title, this.category, this.image, this.content});

  factory EducationContent.fromJson(Map<String, dynamic> json) {
    return EducationContent(
      title: json['title'],
      content: json['content'],
      image: json['image'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'image': image,
      'category': category,
    };
  }
}
