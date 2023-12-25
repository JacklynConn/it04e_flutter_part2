class CategoryModel{
  String? Name, Code, images, Active;
  int? id;

  CategoryModel({this.Name, this.Code, this.images, this.Active, this.id});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Name = json['Name'];
    Code = json['Code'];
    images = json['images'];
    Active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.Name;
    data['Code'] = this.Code;
    data['images'] = this.images;
    data['Active'] = this.Active;
    return data;
  }
}

