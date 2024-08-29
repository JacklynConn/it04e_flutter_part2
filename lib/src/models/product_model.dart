class ProductModel {
  int? id;
  String? productName;
  String? images;
  String? categoryId;
  String? description;
  String? price;
  String? createdAt;
  String? updatedAt;

  ProductModel(
      {this.id,
        this.productName,
        this.images,
        this.categoryId,
        this.description,
        this.price,
        this.createdAt,
        this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['ProductName'];
    images = json['images'];
    categoryId = json['CategoryId'];
    description = json['Description'];
    price = json['Price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ProductName'] = this.productName;
    data['images'] = this.images;
    data['CategoryId'] = this.categoryId;
    data['Description'] = this.description;
    data['Price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
