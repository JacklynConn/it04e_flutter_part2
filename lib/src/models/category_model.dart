class CategoryModel {
  String? name, code, images, active;
  int? id;

  CategoryModel({this.name, this.code, this.images, this.active, this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['Name'],
      code: json['Code'],
      images: json['images'],
      active: json['Active'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = this.name;
    data['Code'] = this.name;
    data['images'] = this.images;
    data['Active'] = this.active;
    return data;
  }
}
