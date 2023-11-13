class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,
  });

  //Map json to object
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  //Map object to json or convert object to json
  Map toJson() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    return map;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }
}
