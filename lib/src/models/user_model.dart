class UserModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? message;
  String? access_token;

  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,
    this.message,
    this.access_token,
  });

  //Map json to object
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    access_token = json['access_token'];
  }

  //Map object to json or convert object to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, phone: $phone, email: $email, password: $password, confirmPassword: $confirmPassword, message: $message, api_token: $access_token}';
  }
}
