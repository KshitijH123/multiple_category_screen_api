class CategoryDetailModel {
  final String slug;
  final String name;
  final String url;

  CategoryDetailModel(
      {required this.slug, required this.name, required this.url});

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailModel(
      slug: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }
}
