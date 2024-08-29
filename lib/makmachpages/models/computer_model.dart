class ComputerModel {
  int? id;
  String? computerName;
  String? imges;
  String? model;
  String? ram;
  String? storage;
  String? os;
  String? price;
  String? vGA;
  String? createdAt;
  String? updatedAt;
  String? active;

  ComputerModel(
      {this.id,
        this.computerName,
        this.imges,
        this.model,
        this.ram,
        this.storage,
        this.os,
        this.price,
        this.vGA,
        this.createdAt,
        this.updatedAt,
        this.active});

  ComputerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    computerName = json['ComputerName'];
    imges = json['Imges'];
    model = json['Model'];
    ram = json['Ram'];
    storage = json['Storage'];
    os = json['Os'];
    price = json['Price'];
    vGA = json['VGA'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ComputerName'] = this.computerName;
    data['Imges'] = this.imges;
    data['Model'] = this.model;
    data['Ram'] = this.ram;
    data['Storage'] = this.storage;
    data['Os'] = this.os;
    data['Price'] = this.price;
    data['VGA'] = this.vGA;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['Active'] = this.active;
    return data;
  }
}
